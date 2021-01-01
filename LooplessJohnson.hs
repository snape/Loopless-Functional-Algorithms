-- This file is part of "Loopless Functional Algorithms".
-- Copyright (c) 2005 Jamie Snape, Oxford University Computing Laboratory.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--   https://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

import List (unfoldr)

import RealTimeQueue

data Rose a  =  Node a (Queue (Rose a))

data Delay a b  =  Hold a b (Queue (Delay a b), Queue (Delay a b))

data Direction  =  Down | DownSkip | Up | UpSkip

type Instruction  =  (Direction,Int,Int,Int)

johnson  =  unfoldr (step step') . prolog step' length' prolog' . list'

list' 1  =  []
list' n  =  zip twoones [2..n-2] ++ [(1,n-1),(0,n)]
            where twoones  =  2:1:twoones

prolog sp lg pg  =  wrapQueue . fst . foldr (tmix sp) (empty,empty) . list lg pg

list lg pg xs  =  [(lg x,a,b) | x <- xs, (a,b) <- [pg x]]

tmix sp (n,a,b) (ytq,qty)  =  if even n then (fmix sp a (ytq,qty),fmix sp b (qty,ytq))
                              else (fmix sp a (ytq,qty),fmix sp b (ytq,qty))

fmix sp a (ytq,qty)  =  case sp a of
                          Nothing     ->  ytq
                          Just (x,b)  ->  insert ytq (Hold x b (ytq,qty))

prolog' (k,n)  =  if even n then ((Down,k,n-1,1),(Up,k,1,n-1))
                  else ((Down,k,n-1,1),(UpSkip,k,1,n-1))

length' (k,n)  =  n-1

wrapQueue xtq  =  consQueue xtq []

consQueue xtq xtqs  =  if isEmpty xtq then xtqs
                       else xtq:xtqs

step sp []          =  Nothing
step sp (xtq:xtqs)  =  Just (x,consQueue (fmix sp a (qty,ytq)) (consQueue ztq xtqs))
                       where (Hold x a (ytq,qty), ztq)  =  remove xtq

step' (Down,k,m,n)      =  if m < n then Nothing
                           else Just (m+k,(DownSkip,k,m-1,n))
step' (DownSkip,k,m,n)  =  if m < n then Nothing
                           else Just (m,(Down,k,m-1,n))
step' (Up,k,m,n)        =  if m > n then Nothing
                           else Just (m+k,(UpSkip,k,m+1,n))
step' (UpSkip,k,m,n)    =  if m > n then Nothing
                           else Just (m,(Up,k,m+1,n))
