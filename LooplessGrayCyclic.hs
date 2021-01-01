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

data Rose a  =  Node a [Rose a]

gray  =  unfoldr step . prolog

prolog n  =  consPair (length tr,tr) []
             where tr  =  [Node (m,x) tr | (m,x) <- zip [0..] [0..n-1]]

step []                          =  Nothing
step ((m,Node (n,x) tr:ts):nts)  =  Just (x,consPair (n,tr) (consPair (m-1,ts) nts))

consPair (n,ts) nts  =  if n==0 then nts
                        else (n,ts):nts
