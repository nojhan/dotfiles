Vim�UnDo� �:2ٵ�p�o/p�w-�W	��~���ܑ?�T�   C                                  ^C�    _�                     
        ����                                                                                                                                                                                                                                                                                                                            
                     v   "    ^C�d    �   	      K   
       5double Detector::operator()(const Position& position)   {   //#ifndef NDEBUG   ://    for(auto&& i : position) {assert(is_normalized(i));}   //#endif   B//@TODO remove when working renau  jeu. 24 oct. 2019 10:08:07 CEST   !    return this->sense(position);   }    5�_�                       
    ����                                                                                                                                                                                                                                                                                                                               
          
          
    ^C�    �         B      #include "sensor.h"   #include "exceptions.h"   #include "debug.h"�         B      #include "carto.h"5�_�                            ����                                                                                                                                                                                                                                                                                                                               
          
          
    ^C�    �         C       �         B    5��