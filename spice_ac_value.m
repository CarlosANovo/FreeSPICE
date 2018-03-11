##       ======= Poor Man's Spice =======
## Copyright (C) 2018 Carlos Novo, Francisco Pimenta
##
## Based on Werner Hoch's spice_readfile. As such, distributed under the same
## license: GNU General Purpose License.
##
## Before running, install ngspice.
##
## Authors: Carlos Novo and Francisco Pimenta
## Description: Functions to easily import, display and process rawdata 
## generated by ngspice.

function spice_ac_value(axis, output, frequency, figureAC)
  index_freq = find(axis(:)>=frequency,1);
  close_freq = axis(index_freq);
  close_value = abs(output(index_freq));
  disp(["Close frequency: " num2str(close_freq)]);
  disp(["Close value: " num2str(close_value) " (" num2str(mag2db(close_value)) "dB)"]);
  
  if (nargin < 4)
    place_mark = 0;
  else
    place_mark = input("Place mark on graph? (0/1): ")
  endif
  if (place_mark > 0)
    figure(figureAC)
    hold on
    semilogx(close_freq, mag2db(close_value), 'ro');
  endif
endfunction