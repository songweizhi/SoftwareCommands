
check.packages <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = 1)
}


# install/load library 
packages<-c("tools", "optparse", "ggplot2")
check.packages(packages)


options(warn=-1)
option_list = list(
  make_option(c("-in", "--infile"), 
              type="character", 
              help="input file, e.g. ML_recruitment_output.tab", 
              metavar="character"));
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);


# read in data
data = read.table(opt$infile, header=TRUE, sep='\t')


# define file name of output plots
infile_no_extension = file_path_sans_ext(basename(opt$infile))
plot_BH_tSNE_Cluster_bin = paste(infile_no_extension, 'BH_tSNE_Cluster_bin.png', sep = '_')
plot_BH_tSNE_Phylum = paste(infile_no_extension, 'BH_tSNE_Phylum.png', sep = '_')
plot_GC_Coverage = paste(infile_no_extension, 'GC_Coverage.png', sep = '_')


# get plot BH_tSNE_Cluster_bin
png(filename=plot_BH_tSNE_Cluster_bin, units="in", width=10, height=10, pointsize=12, res=300)
ggplot( data, aes( x = bh_tsne_x, y = bh_tsne_y, col = ML_expanded_clustering )) + 
  geom_point( aes( alphs = 0.5, size = sqrt( data$length ) / 100 )) + 
  guides( color = 'legend', size = 'none', alpha = 'none' ) + 
  theme_classic() + xlab('BH-tSNE X') + ylab('BH-tSNE Y') + 
  guides( color = guide_legend( title = 'Cluster/bin' ))
invisible(dev.off())


# get plot BH_tSNE_Phylum
png(filename=plot_BH_tSNE_Phylum, units="in", width=10, height=10, pointsize=12, res=300)
ggplot( data, aes( x = bh_tsne_x, y = bh_tsne_y, col = phylum )) + 
  geom_point( aes( alphs = 0.5, size = sqrt( data$length ) / 100 )) + 
  guides( color = 'legend', size = 'none', alpha = 'none' ) + 
  theme_classic() + xlab('BH-tSNE X') + ylab('BH-tSNE Y') + 
  guides( color = guide_legend( title = 'Phylum' ))
invisible(dev.off())


# get plot GC_Coverage
png(filename=plot_GC_Coverage, units="in", width=10, height=10, pointsize=12, res=300)
ggplot( data, aes( x = cov, y = gc, col = ML_expanded_clustering )) + 
  geom_point( aes( alphs = 0.5, size = sqrt( data$length ) / 100 )) + 
  guides( color = 'legend', size = 'none', alpha = 'none' ) + 
  theme_classic() + xlab('Coverage') + ylab('GC (%)') + 
  guides( color = guide_legend( title = 'Cluster/bin' )) + 
  scale_x_continuous( limits = c( 200, 250 ))
invisible(dev.off())

