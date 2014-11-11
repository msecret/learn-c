#! /bin/bash
set -e

DAT=db5.dat


./ex17 $DAT c

./ex17 $DAT s 1 poop poop@poop.p m
./ex17 $DAT s 2 moop moop@moop.c m
./ex17 $DAT s 3 doop doop@doop.t f
./ex17 $DAT s 4 loop loop@loop.r m
./ex17 $DAT s 5 toop toop@toop.q f

./ex17 $DAT l

./ex17 $DAT g 1
./ex17 $DAT g 2
./ex17 $DAT g 4

./ex17 $DAT d 4
./ex17 $DAT g 5

./ex17 $DAT f s m
./ex17 $DAT f s f
