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

