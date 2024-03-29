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

module RealTimeQueue (Queue,empty,isEmpty,insert,remove) where

type Queue a  =  ([a],[a],[a])

empty  =  ([],[],[])

isEmpty (xs,ys,zs)  =  null xs

insert (xs,ys,zs) x  =  chkQueue (xs,x:ys,zs)

remove (x:xs,ys,zs)  =  (x,chkQueue (xs,ys,zs))

chkQueue (xs,ys,[])    =  (zs,[ ],zs)
                          where zs  =  rot xs ys []
chkQueue (xs,ys,z:zs)  =  (xs,ys,zs)

rot [] [y] zs         =  y:zs
rot (x:xs) (y:ys) zs  =  x:rot xs ys (y:zs)
