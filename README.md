Loopless Functional Algorithms
==============================

<https://www.jamiesnape.io/publications/msc/>

[![DOI](https://zenodo.org/badge/8990554.svg)](https://zenodo.org/badge/latestdoi/8990554)

Copyright &copy; 2005 Jamie Snape, Oxford University Computing Laboratory.

*Loopless algorithms* generate successive combinatorial patterns in constant
time, producing the first in time linear to the size of input. Although
originally formulated in an imperative setting, we propose a functional
interpretation of these algorithms in the lazy language Haskell. Since it may
not be possible to produce a pattern in constant time, a list of integers
generated using the library function `unfoldr` determines the transitions
between consecutive patterns.

The generation of Gray codes, permutations, ideals of posets and
combinations illustrate applications of loopless algorithms in both imperative
and functional form, particularly derivations of the Koda-Ruskey and
Johnson-Trotter algorithms. Common themes in the construction of loopless
imperative algorithms, such as focus pointers, doubly-linked lists and
coroutines, contrast greatly with the functional uses of real-time queues, tree
traversals, fusion and tupling.


Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this software except in compliance with the License. You may obtain a copy of
the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.
