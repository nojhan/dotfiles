Vim�UnDo� a�b������噰�O#8�r�����HLJ�  N                 *       *   *   *    ^_��    _�                        
    ����                                                                                                                                                                                                                                                                                                                                                             ^G�`     �        B      #include "utils.h"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^G�b     �        C      #include "debug.h"�        B    5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                             ^G�d    �        B      #include "debug.h"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ^G��     �        C      #include "debug.h"�        B    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ^G��     �        C      #include "debug.h"�        B    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ^G��     �        C      #include "debug.h"�        B    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ^G��     �        C      #include "debug.h"�      	  B    5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                             ^G��     �        C      #include "debug.h"�      
  B    5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                             ^G��    �                #include "debug.h"5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             ^T��     �        A    �        A    5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                V       ^T��     �        G      <        std::pair<Weft,morph::Morphism<double,size_t>> flat(   +                size_t min_i, size_t max_i,   +                size_t min_j, size_t max_j,   +                double min_x, double max_x,   +                double min_y, double max_y,   &                double elevation = 0);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       ^T��     �        G      8    std::pair<Weft,morph::Morphism<double,size_t>> flat(   '            size_t min_i, size_t max_i,   '            size_t min_j, size_t max_j,   '            double min_x, double max_x,   '            double min_y, double max_y,5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       ^T��     �        G      "            double elevation = 0);5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       ^T��     �        G              double elevation = 0);5�_�                            ����                                                                                                                                                                                                                                                                                                                                       +           V        ^T��     �                .    morph::Range<double> range_x = {0,size_x};   .    morph::Range<double> range_y = {0,size_y};   .    morph::Range<size_t> range_i = {0,size_i};   .    morph::Range<size_t> range_j = {0,size_j};   4    std::shared_ptr<morph::Morph<double,size_t>> lm1   ^     = std::make_shared<morph::Linear<double,size_t>>(range_x,range_i); // Mapping from x to i   4    std::shared_ptr<morph::Morph<double,size_t>> lm2   ^     = std::make_shared<morph::Linear<double,size_t>>(range_y,range_j); // Mapping from y tp j       U    morph::Morphism<double,size_t> m_dem = morph::Morphism<double,size_t>({lm1,lm2});       B    Weft dem = Weft(size_i, std::vector<float>(size_j,elevation));       return {dem,m_dem};5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        ^T��     �      '  =    �        =    5�_�                    '        ����                                                                                                                                                                                                                                                                                                                            ,           ,           V        ^T��     �   &   '           5�_�                    *        ����                                                                                                                                                                                                                                                                                                                            +           +           V        ^T��     �   *   ,  J          �   *   ,  I    5�_�                    +       ����                                                                                                                                                                                                                                                                                                                            ,           ,           V        ^T��    �   *   ,  J          return flat();5�_�                       &    ����                                                                                                                                                                                                                                                                                                                               &          )          )    ^T�     �        J      *    morph::Range<double> range_x = {0,_x};�        J      .    morph::Range<double> range_x = {0,size_x};   .    morph::Range<double> range_y = {0,size_y};   .    morph::Range<size_t> range_i = {0,size_i};   .    morph::Range<size_t> range_j = {0,size_j};5�_�                       $    ����                                                                                                                                                                                                                                                                                                                               $          $          $    ^T�	     �        J      ,    morph::Range<double> range_x = {,max_x};�        J      -    morph::Range<double> range_x = {0,max_x};   -    morph::Range<double> range_y = {0,max_y};   -    morph::Range<size_t> range_i = {0,max_i};   -    morph::Range<size_t> range_j = {0,max_j};5�_�                       (    ����                                                                                                                                                                                                                                                                                                                               $          $          $    ^T�     �        J      0    morph::Range<double> range_x = {min_,max_x};5�_�                       (    ����                                                                                                                                                                                                                                                                                                                               $          $          $    ^T�     �        J      0    morph::Range<double> range_y = {min_,max_y};5�_�                       (    ����                                                                                                                                                                                                                                                                                                                               $          $          $    ^T�     �        J      0    morph::Range<size_t> range_i = {min_,max_i};5�_�                       (    ����                                                                                                                                                                                                                                                                                                                               $          $          $    ^T�     �        J      0    morph::Range<size_t> range_j = {min_,max_j};5�_�                       (    ����                                                                                                                                                                                                                                                                                                                               $          $          $    ^T�    �        J      1    morph::Range<double> range_x = {min_i,max_x};5�_�                           ����                                                                                                                                                                                                                                                                                                                               $          $          $    ^T�    �        J              double elevation = 0)5�_�                    %       ����                                                                                                                                                                                                                                                                                                                            %          %          v       ^T�     �   $   &  J      B    Weft dem = Weft(size_i, std::vector<float>(size_j,elevation));5�_�                    %   2    ����                                                                                                                                                                                                                                                                                                                            %          %          v       ^T�    �   $   &  J      A    Weft dem = Weft(max_i, std::vector<float>(size_j,elevation));5�_�                           ����                                                                                                                                                                                                                                                                                                                                                       ^T�    �        J      #        size_t min_i, size_t max_i,   #        size_t min_j, size_t max_j,5�_�                     +       ����                                                                                                                                                                                                                                                                                                                            +          +          v       ^T��     �   *   ,  J      C    return flat(0,size_i, 0,size_j, 0,size_x, 0,size_y, elevation);5�_�      !               +       ����                                                                                                                                                                                                                                                                                                                            +          +          v       ^T��   	 �   *   ,  J      A    return flat(size_i, 0,size_j, 0,size_x, 0,size_y, elevation);5�_�       "           !      $    ����                                                                                                                                                                                                                                                                                                                               $          (          (    ^T�   
 �        J      ,    morph::Range<size_t> range_i = {,max_i};�        J      1    morph::Range<size_t> range_i = {min_i,max_i};   1    morph::Range<size_t> range_j = {min_j,max_j};5�_�   !   #           "      ,    ����                                                                                                                                                                                                                                                                                                                                                             ^_v�     �        J    5�_�   "   $           #           ����                                                                                                                                                                                                                                                                                                                                                             ^_v�    �       "  K    5�_�   #   %           $   #   [    ����                                                                                                                                                                                                                                                                                                                                                             ^_w�    �   "   $  L      ^     = std::make_shared<morph::Linear<double,size_t>>(range_y,range_j); // Mapping from y tp j5�_�   $   &           %           ����                                                                                                                                                                                                                                                                                                                                                             ^_��     �        M          �        L    5�_�   %   '           &          ����                                                                                                                                                                                                                                                                                                                                                             ^_��     �        M    �        M    5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                                                             ^_��     �        N          assert(max_x > min_x);5�_�   '   )           (          ����                                                                                                                                                                                                                                                                                                                                                             ^_��    �        N          assert(max_y > min_x);5�_�   (   *           )           ����                                                                                                                                                                                                                                                                                                                                                             ^_��     �        O          �        N    5�_�   )               *          ����                                                                                                                                                                                                                                                                                                                                                             ^_��    �                    assert(max_5��