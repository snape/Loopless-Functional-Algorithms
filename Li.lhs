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

> data Dtree  =  Node Int [(Direction,Dtree)] 

> data Direction  =  Down | Up 

> type Bit  =  Int 

> trans  =  mixall . map treeTrans 

> treeTrans  =   gray . foldTree mkWBGtrans 
>                where mkWBGtrans n     =  mkGtrans n . foldr mkWBtrans ([],[]) 
>                      gray (ws,bs,gs)  =  gs 

> mkGtrans n (ws,bs)  =  (ws,bs,ws ++ [n] ++ bs) 

> foldTree f (Node n dts)  =  f n [(d,foldTree f t) | (d,t) <- dts] 

> mkWBtrans (Down,(wx,bx,gx)) (wy,by)  =  (mex wx wy,mix gx by) 
> mkWBtrans (Up,(wx,bx,gx)) (wy,by)    =  (mex (reverse gx) wy,mix (reverse bx) by) 

> mex wx wy  =  reverse (mix wx (reverse wy)) 

> mix [] ys      =  ys 
> mix (x:xs) ys  =  ys ++ x:mix xs (reverse ys) 

> mixall  =  foldr mix [] 

> start  =  concat . map treeStart 

> treeStart  =  third . foldTree treeConfigs 
>               where treeConfigs n  =  foldr mkWBconfigs (True,True,[],[],[])

> third (elwy,elby,iy,my,ey)  =  0:iy

> mkWBconfigs (Down,(elwx,elbx,ix,mx,ex)) (elwy,elby,iy,my,ey) 
>   |  elwx && elbx          =  (elwy,False,0:mx ++ iy,0:ix ++ my,1:ex ++ my) 
>   |  elwx && not elbx      =  (elwy,elby,0:mx ++ iy,0:ix ++ my,1:ex ++ ey) 
>   |  not elwx && elbx      =  (False,elby,0:mx ++ my,0:ix ++ my,1:ex ++ ey) 
>   |  not elwx && not elbx  =  (False,False,0:mx ++ my,0:ix ++ my,1:ex ++ my)

> mkWBconfigs (Up,(elwx,elbx,ix,mx,ex)) (elwy,elby,iy,my,ey) 
>   |  elwx && elbx          =  (False,elby,0:ix ++ my,1:ex ++ my,1:mx ++ ey) 
>   |  elwx && not elbx      =  (elwy,False,0:ix ++ iy,1:ex ++ my,1:mx ++ my) 
>   |  not elwx && elbx      =  (elwy,elby,0:ix ++ my,1:ex ++ my,1:mx ++ ey) 
>   |  not elwx && not elbx  =  (False,False,0:ix ++ my,1:ex ++ my,1:mx ++ my)
