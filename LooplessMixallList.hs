-- This file is part of "Loopless Functional Algorithms".
--
-- SPDX-FileCopyrightText: 2005 Jamie Snape, Oxford University Computing Laboratory
-- SPDX-License-Identifier: Apache-2.0
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

module LooplessMixallList where

import List (unfoldr)

mixall  =  unfoldr step . prolog

prolog  =  extract . mkRows'

mkRows'  =  foldr op ((0,0),([],[]))

op xs ((p,q),(tr,br))  =  if even n then ((p,q+n),(sc++tr,cs++br))
                          else ((p+q,n),(sc++tr,cs++br))
                          where n    =  length xs
                                cs   =  zip xs pqs
                                sc   =  reverse cs
                                pqs  =  (p,q):(p+q,0):pqs

extract ((p,q),rs)  =  (sr,wrapRow ((p+q,0),sr))
                       where sr  =  pair reverse rs

pair f (x,y)  =  (f x,f y)

wrapRow r  =  consRow r []

consRow ((p,q),rs) r  =  if p==0 && q==0 then r
                         else ((p,q),rs):r

next rs ((x,(p,q)),r)  =  Just (x,(rs,consRow ((p,q),rs) r))

step (rs,[])                     =  Nothing
step (rs,((p,q),(t:tr,b:br)):r)  =  if p==0 then next rs (b,consRow ((p,q-1),(tr,br)) r)
                                    else next rs (t, consRow ((p-1,q),(tr,br)) r)
