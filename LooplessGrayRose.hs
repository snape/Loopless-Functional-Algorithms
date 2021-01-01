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

gray  =  unfoldr step . prolog

prolog n  =  (wrapQueue . wrapTree . foldr tmix Nothing) [n-1,n-2..0]

tmix n mxt  =  mxt `o` Just (Node n empty) `o` mxt

Nothing `o` myt                =  myt
mxt `o` Nothing                =  mxt
Just (Node x xtq) `o` Just yt  =  Just (Node x (insert xtq yt))

wrapTree Nothing    =  empty
wrapTree (Just xt)  =  insert empty xt

wrapQueue xtq  =  consQueue xtq []

consQueue xtq xtqs  =  if isEmpty xtq then xtqs
                       else xtq:xtqs

step []          =  Nothing
step (xtq:xtqs)  =  Just (x,consQueue ytq (consQueue ztq xtqs))
                    where (Node x ytq,ztq) = remove xtq
