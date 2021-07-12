# The program is based on the descriptions at
#
# https://en.wikipedia.org/wiki/Random_forest
#
# https://machinelearningmastery.com/implement-random-forest-scratch-python/
#
# https://github.com/Happyxianyueveryday/mpi-random-forest
#
# https://github.com/anthonytw/Random-Forest-MPI
#
# https://kogalur.github.io/randomForestSRC/theory.html
#
# A. Cliff, J. Romero, D. Kainer, A. Walker, A. Furches and D. Jacobson,
# "A High-Performance Computing Implementation of Iterative Random Forest 
# for the Creation of Predictive Expression Networks"
# http://dx.doi.org/10.3390/genes10120996

require "mpi"
if defined?(NumRu::NArray)
  include NumRu
end

MPI.Init

world = MPI::Comm::WORLD

size = world.size
rank = world.rank

def usage(rank)
 if rank==0
   print <<EOF
Usage: mpirun -np numproc ruby #$0
EOF
 end
  MPI.Finalize
  exit -1
end


MPI.Finalize
