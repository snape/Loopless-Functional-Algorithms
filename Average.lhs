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

> average  =  div' . fork (sum',length')

> sum'  =  foldr (+) 0

> length'  =  foldr succ 0
>             where succ x n  =  n+1

> fork (f,g) x  =  (f x,g x)

> div' (0,0)  =  0
> div' (x,y)  =  x/y

> average'  =  div' . foldr pluss (0,0)
>              where pluss x (y, n) = (x+y,n+1)
