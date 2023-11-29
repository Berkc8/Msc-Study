set key autotitle columnheader
set title 'komo report'
plot 'z.komoData' \
      u (($0+1)/30):1 w l lw 3 lc 1 lt 1 \
  ,'' u (($0+1)/30):2 w l lw 3 lc 2 lt 1 \
  ,'' u (($0+1)/30):3 w l lw 3 lc 3 lt 1 \
  ,'' u (($0+1)/30):4 w l lw 3 lc 4 lt 1 \
  ,'' u (($0+1)/30):5 w l lw 3 lc 5 lt 1 \
  ,'' u (($0+1)/30):6 w l lw 3 lc 6 lt 1 \
  ,'' u (($0+1)/30):7 w l lw 3 lc 7 lt 1 \
  ,'' u (($0+1)/30):8 w l lw 3 lc 8 lt 1 \
  ,'' u (($0+1)/30):9 w l lw 3 lc 9 lt 1 \
  ,'' u (($0+1)/30):10 w l lw 3 lc 10 lt 0 \
  ,'' u (($0+1)/30):11 w l lw 3 lc 11 lt 0 \
  ,'' u (($0+1)/30):12 w l lw 3 lc 12 lt 0 \
  ,'' u (($0+1)/30):13 w l lw 3 lc 13 lt 0 \
  ,'' u (($0+1)/30):14 w l lw 3 lc 14 lt 0 \
  ,'' u (($0+1)/30):15 w l lw 3 lc 15 lt 0 \
  ,'' u (($0+1)/30):16 w l lw 3 lc 16 lt 0 \

