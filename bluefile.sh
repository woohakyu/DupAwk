awk -F',' 'BEGIN{n=1;fEqual=0;}{
 idx = n;
 nf = 1;
 midLst[ idx ] = sprintf("%s", $nf);

 for( nf = 2; nf <= NF; nf++ )
 {
   cmpA = sprintf("%s", $nf);
   for( tnf = 2; tnf <= (nf-1); tnf++ )
   {
     cmpB = sprintf("%s", $tnf);

     printf("check point ...M[%s] CMP[%d:%s][%d:%s]",
       midLst[idx], nf, cmpA, tnf, cmpB);
     if(strCmp(cmpA,cmpB)==0) 
     {
       printf(" EQAL OK\n");
       fEqual = 1;
       break;
     }
     else printf(" EQAL NOK\n");
   }

   if(fEqual==1) fEqual=0;
   else {if(nf==2) midVal[ idx ] = sprintf("%s", cmpA);else midVal[ idx ] = sprintf("%s,%s", midVal[ idx ], cmpA);}
 }

 n += 1;
}END{
for( loop = 1; loop <= idx; loop++ )
{
  printf("mid[%s] >> val[%s]\n", midLst[ loop ], midVal[ loop ]);
}
}func strCmp(st1, st2){
  lst1=length(st1);
  lst2=length(st2);

  if(lst1>=lst2) mLen=lst1;
  else mLen=lst2;

  for(len=1;len<=mLen;len++)
  {
    ch1 = substr(st1,len,1);
    ch2 = substr(st2,len,1);
    if(ch1 != ch2) return 1;
  }
  return 0;
}' bluefile.txt
