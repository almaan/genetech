library(Matrix)

exprMat <- readMM(file = "~/Downloads/Wu_etal_2021_allcells_raw_counts.mtx")
genes <- read.table(file = "~/Downloads/Wu_etal_2021_allcells_genes.tsv")$V1
barcodes <- read.table(file = "~/Downloads/Wu_etal_2021_allcells_barcodes.tsv")$V1
colnames(exprMat) <- barcodes
rownames(exprMat) <- genes
metadata <- fread(file = "~/Downloads/Wu_etal_2021_metadata.txt", header = TRUE, sep = "\t", skip = 1)
metadata  <- setNames(metadata, strsplit(readLines(con = "~/Downloads/Wu_etal_2021_metadata.txt", n = 1), "\t") %>% unlist())

keepids <- metadata %>%
  subset(!CellType %in% c("Doublets", "Unassigned", "Mouse 3T3 spike-in")) %>%
  slice_sample(prop = 0.05, weight_by = 1/table(CellType)[CellType]) %>%
  pull(NAME)
  
exprMat_downsampled <- exprMat[, keepids]
exprMat_downsampled <- exprMat_downsampled[rowSums(exprMat_downsampled) > 0, ]
metadata_downsampled <- metadata[metadata$NAME %in% keepids, ]
metadata_downsampled <- data.frame(metadata_downsampled, row.names = 1)
metadata_downsampled <- metadata_downsampled[, c("sex", "Condition", "CellType")]

bc <- CreateSeuratObject(counts = exprMat_downsampled, meta.data = metadata_downsampled)
bc <- SCTransform(bc)
bc <- RunPCA(bc)
bc <- RunUMAP(bc, reduction = "pca", dims = 1:30)

bc <- FindNeighbors(bc, reduction = "pca", dims = 1:30)
bc <- FindClusters(bc)

p1 <- DimPlot(bc, group.by = "seurat_clusters", label = T)
p2 <- DimPlot(bc, group.by = "CellType", label = T)
p1 - p2

bc <- CellCycleScoring(object = bc, s.features = cc.genes.updated.2019$s.genes, g2m.features = cc.genes.updated.2019$g2m.genes)

conv <- c("0" = "Macrophages", "1" = "Endothelial 1", "2" = "T-cells", "3" = "CAFs",
          "4" = "B-cells", "5" = "PVL cells", "6" = "Myoepithelial", "7" = "Cancer", 
          "8" = "NK cells", "9" = "Plasmablasts", "10" = "T-cells cycling",  
          "12" = "pDCs", "13" = "Cancer/Epithelial", "14" = "Mast cells", "15" = "cDCs",
          "19" = "Endothelial 2", "20" = "T-cells cycling")

bc.subset <- subset(bc, seurat_clusters %in% names(conv))
bc.subset$CellType <- conv[as.character(bc.subset$seurat_clusters)]

p1 <- DimPlot(bc.subset, group.by = "seurat_clusters", label = T)
p2 <- DimPlot(bc.subset, group.by = "CellType", label = T)
p1 - p2

bc.subset <- bc.subset %>%
  SCTransform() %>%
  RunPCA() %>%
  RunUMAP(reduction = "pca", dims = 1:30)

bc.subset <- bc.subset %>%
  FindNeighbors(reduction = "pca", dims = 1:30) %>%
  FindClusters(resolution = 0.6)

p1 <- DimPlot(bc.subset, group.by = "seurat_clusters", label = T)
p2 <- DimPlot(bc.subset, group.by = "CellType", label = T)
p1 - p2

bc.subset <- SetIdent(bc.subset, value = "orig.ident")
bc.subset@assays$SCT@scale.data <- matrix()
saveRDS(bc.subset, file = "~/genetech/labs/ex3/data/bc")
