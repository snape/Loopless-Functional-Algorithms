This file is part of "Loopless Functional Algorithms".
Copyright (c) 2005 Jamie Snape, Oxford University Computing Laboratory.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

> import List (unfoldr)

> import RealTimeQueue

> data Rose a  =  Node a (Queue (Rose a))

> data Delay a b = Hold a b (Queue (Delay a b), Queue (Delay a b))

mixall . map (unfoldr sp . fst . pg)  =  unfoldr (step sp) . prolog sp lg pg

> prolog sp lg pg  =  wrapQueue . fst . foldr (tmix sp) (empty,empty) . list lg pg

> list lg pg xs  =  [(lg x,a,b) | x <- xs, (a,b) <- [pg x]]

> tmix sp (n,a,b) (ytq,qty)  =  if even n then (fmix sp a (ytq,qty),fmix sp b (qty,ytq))
>                               else (fmix sp a (ytq,qty),fmix sp b (ytq,qty))

> fmix sp a (ytq,qty)  =  case sp a of
>                           Nothing     ->  ytq
>                           Just (x,b)  ->  insert ytq (Hold x b (ytq,qty))

> append  =  foldl insert

> wrapQueue xtq  =  consQueue xtq []

> consQueue xtq xtqs  =  if isEmpty xtq then xtqs
>                        else xtq:xtqs

> step sp []          =  Nothing
> step sp (xtq:xtqs)  =  Just (x,consQueue (fmix sp a (qty,ytq)) (consQueue ztq xtqs))
>                        where (Hold x a (ytq,qty), ztq)  =  remove xtq
