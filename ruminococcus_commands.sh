# First, download Living Tree Project data file, LTPs132_datasets.fasta.tar.gz
# Link at https://www.arb-silva.de/projects/living-tree/

tar xvzf LTPs132_datasets.fasta.tar.gz

# This is my own program, github.com/kylebittinger/okfasta
okfasta searchdesc Ruminococcus --input LTPs132_SSU_compressed.fasta > ruminococcus.fasta

# conda install -c bioconda muscle
muscle -in ruminococcus.fasta -out ruminococcus_muscle.fasta

# conda install -c bioconda raxml
raxmlHPC -s ruminococcus_muscle.fasta -n ruminococcus_muscle -m GTRGAMMA -f a -x 42 -N autoMRE -p 314159

# Install FigTree from http://tree.bio.ed.ac.uk/software/figtree/
# Open RAxML_bipartitions.ruminococcus_muscle in FigTree
# Enter "bootstrap" for node attribute name
# Re-root to midpoint
# Import annotations from ruminococcus_annotations.tsv
# Set tip labels to species
# Set node labels to bootstrap
# Re-size, export PDF

# We need to make a BLAST database before searching for hits
makeblastdb -dbtype nucl -in ruminococcus.fasta

# Now we can BLAST the R. gnavus sequence into all the Ruminococcus 16S sequences
blastn -query ruminococcus_gnavus.fasta -db ruminococcus.fasta -outfmt 7 > ruminococcus_gnavus_blast.tsv
