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

data Tree a  =  Null | Fork a (Tree a) (Tree a)

preorder  =  unfoldr step . doubleWrap
             where doubleWrap xt  =  [[xt]]

inorder  =  unfoldr step . prolog

prolog  =  wrapList . mkSpines

mkSpines t  =  addSpines t []

addSpines Null sps            =  sps
addSpines (Fork x lt rt) sps  =  addSpines lt (Node x (mkSpines rt):sps)

wrapList xs  =  consList xs []

consList xs xss  =  if null xs then xss
                    else xs:xss

step []                      =  Nothing
step ((Node x xts:yts):tss)  =  Just (x,consList xts (consList yts tss))
