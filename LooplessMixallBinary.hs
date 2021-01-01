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

data Rose a  =  Node a ([Rose a],[Rose a]) | Splice (Int,Int) ([Rose a],[Rose a])

mixall  =  unfoldr step . prolog

prolog  =  fst . shareSpines'

shareSpines' xss  =  pair reverse (foldr addPair' ([],[]) xss)
                     where addPair' xs (psl,psr)  =  if null xs then (psl,psr)
                                                     else (Node (xs,False,p,q) rs:psl,Node (sx,even (length xs),p,q) rs:psr)
                                                     where sx     =  reverse xs
                                                           (p,q)  =  shape psr
                                                           rs     =  shareSpines' xss

shape []                             =  (0,0)
shape (Node (x:xs,swap,p,q) rs:psr)  =  if swap then (p,q+1)
                                        else (p+q,1)

pair f (x,y)  =  (f x,f y)

consSplice (Splice (p,q) rs) ps  =  if p==0 && q==0 then ps
                                    else Splice (p,q) rs:ps

step []                             =  Nothing
step (Node (x:xs,swap,p,q) rs:ps)   =  if null xs then Just (x,consSplice sp ps)
                                       else Just (x,consSplice sp  (Node (xs,not swap,p,q) rs:ps))
                                       where sp  =  if swap then Splice (p+q,0) rs
                                                    else Splice (p,q) rs
step (Splice (p,q) (t:tr,b:br):ps)  =  if p==0 then step (b:consSplice (Splice (p,q-1) (tr,br)) ps)
                                       else step (t:consSplice (Splice (p-1,q) (tr,br)) ps)
