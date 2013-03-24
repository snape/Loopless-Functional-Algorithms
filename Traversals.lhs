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

> data Rose a  =  Node a [Rose a]

> data Tree a  =  Null | Fork a (Tree a) (Tree a)

> preorder (Node x xts)  =  x:concat (map preorder xts)

> inorder (Fork x lt rt)  =  inorder lt ++ x:inorder rt
