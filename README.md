<!--
This file is part of "Loopless Functional Algorithms".

SPDX-FileCopyrightText: 2005 Jamie Snape, Oxford University Computing Laboratory
SPDX-License-Identifier: CC-BY-SA-4.0

Creative Commons Attribution-ShareAlike 4.0 International Public License

You are free to:

* Share -- copy and redistribute the material in any medium or format

* ShareAlike -- If you remix, transform, or build upon the material, you must
  distribute your contributions under the same license as the original

* Adapt -- remix, transform, and build upon the material for any purpose, even
  commercially.

The licensor cannot revoke these freedoms as long as you follow the license
terms.

Under the following terms:

* Attribution -- You must give appropriate credit, provide a link to the
  license, and indicate if changes were made. You may do so in any reasonable
  manner, but not in any way that suggests the licensor endorses you or your
  use.

* No additional restrictions -- You may not apply legal terms or technological
  measures that legally restrict others from doing anything the license
  permits.

Notices:

* You do not have to comply with the license for elements of the material in
  the public domain or where your use is permitted by an applicable exception
  or limitation.

* No warranties are given. The license may not give you all of the permissions
  necessary for your intended use. For example, other rights such as publicity,
  privacy, or moral rights may limit how you use the material.
-->

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

<!-- REUSE-IgnoreStart -->
SPDX-FileCopyrightText: 2005 Jamie Snape, Oxford University Computing Laboratory
SPDX-License-Identifier: Apache-2.0

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this software except in compliance with the License. You may obtain a copy of
the License at

&nbsp;&nbsp;<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.

The author may be contacted via:

Jamie Snape  
Oxford University Computing Laboratory  
Wolfson Building  
Parks Road  
Oxford  
OX1 3QD  
United Kingdom
<!-- REUSE-IgnoreEnd -->
