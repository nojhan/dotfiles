Vim�UnDo� _rٙ9q6��0��*��8��m�3�XT8z�`   2                    *    (                          ^B}�    _�                     #       ����                                                                                                                                                                                                                                                                                                                            )          )   T       v   [    ^Bq�    �   #   &   K    �   #   $   K    5�_�                       &    ����                                                                                                                                                                                                                                                                                                                            +          +   T       v   [    ^Bq�     �         M    �         M    5�_�                       '    ����                                                                                                                                                                                                                                                                                                                            -          -   T       v   [    ^Bq�     �         O      '                    const double range_5�_�                       .    ����                                                                                                                                                                                                                                                                                                                               .          /          /    ^Bq�    �         O      /                    const double dist_power = ,�         O      1                    const double dist_power = 24,   1                    const double dist_shift = 24,5�_�                        1    ����                                                                                                                                                                                                                                                                                                                               .          /          /    ^Bq�     �       #   O    �       !   O    5�_�                        H    ����                                                                                                                                                                                                                                                                                                                               .          /          /    ^Bq�     �      !   Q      H                    geo(dem,m,target_height,x,y,height,bottom_elevation)5�_�                    "   ,    ����                                                                                                                                                                                                                                                                                                                               .          /          /    ^Bq�    �   !   #   Q      ,                    _dist_shift(dist_shift),5�_�      	                 0    ����                                                                                                                                                                                                                                                                                                                               .          /          /    ^Bq�    �         Q      0                    const double dist_shift = 5,5�_�      
           	      .    ����                                                                                                                                                                                                                                                                                                                               .          .          .    ^Br    �         Q      /                    const double dist_power = ,�         Q      0                    const double dist_power = 5,   /                    const double dist_shift = 55�_�   	              
      .    ����                                                                                                                                                                                                                                                                                                                               .          .          .    ^Br    �         Q      /                    const double dist_power = ,�         Q      0                    const double dist_power = 2,   /                    const double dist_shift = 25�_�   
                    %    ����                                                                                                                                                                                                                                                                                                                               %          (       v   (    ^BrV     �          Q      =                    range(range_, {0,1000}), // in meters (?)5�_�                       A    ����                                                                                                                                                                                                                                                                                                                               A          H       v   H    ^Br�    �          Q      ]                    range(range_, {0,std::numeric_limit<double>::infinity}), // in meters (?)5�_�                       7    ����                                                                                                                                                                                                                                                                                                                               A          H       v   H    ^Br�    �          Q      Z                    range(range_, {0,std::numeric_limit<double>::max()}), // in meters (?)5�_�                       !    ����                                                                                                                                                                                                                                                                                                                               !          %          %    ^B|�     �         Q      0                    const double dist_power = 5,   /                    const double dist_shift = 55�_�                           ����                                                                                                                                                                                                                                                                                                                               !          %          %    ^B|�     �                *                    const double shift = 55�_�                       *    ����                                                                                                                                                                                                                                                                                                                               !          %          %    ^B|�     �         P      +                    const double power = 5,5�_�                    !       ����                                                                                                                                                                                                                                                                                                                               !          %          %    ^B|�     �       !          +                    _dist_shift(dist_shift)5�_�                             ����                                                                                                                                                                                                                                                                                                                                                    V        ^B|�   	 �      !          ,                    _dist_power(dist_power),5�_�                    '       ����                                                                                                                                                                                                                                                                                                                                                    V        ^B|�     �   &   '          )                const double _dist_shift;5�_�                    &        ����                                                                                                                                                                                                                                                                                                                            &          &          V       ^B|�   
 �   %   '          )                const double _dist_power;5�_�                        !    ����                                                                                                                                                                                                                                                                                                                            &          &          V       ^B|�    �      !   N      "                    _power(power),5�_�                           ����                                                                                                                                                                                                                                                                                                                            &          &          V       ^B}�     �                *                    const double power = 55�_�                       '    ����                                                                                                                                                                                                                                                                                                                            %          %          V       ^B}�     �         M      (                    const double range_,5�_�                    %       ����                                                                                                                                                                                                                                                                                                                            %          %          V       ^B}�     �   $   %          $                const double _power;5�_�                           ����                                                                                                                                                                                                                                                                                                                            %          %          V       ^B}�     �                !                    _power(power)5�_�                       H    ����                                                                                                                                                                                                                                                                                                                            $          $          V       ^B}�    �         K      I                    geo(dem,m,target_height,x,y,height,bottom_elevation),5�_�                    (       ����                                                                                                                                                                                                                                                                                                                            (          A          v       ^B}�     �   '   )   2                       * �   '   )   K                       * @verbatim   T                 * gnuplot> plot [0:1] [0:1] 4*((1/2-1/pi*atan(x*7-7+((1-1)*7)))**2)                    *    _                 *     1 +--------------------------------------------------------------------+   _                 *       |             +             +            +             +             |   _                 *       |                    4*((1/2-1/pi*atan(x*7-7+((1-1)*7)))**2) ******* |   _                 *       |*                                                                   |   _                 *   0.8 |*****************                                                 +-|   _                 *       |                ***********                                         |   _                 *       |                           *******                                  |   _                 *       |                                  ******                            |   _                 *   0.6 |-+                                     *****                      +-|   _                 *       |                                            ***                     |   _                 *       |                                               ***                  |   _                 *       |                                                  **                |   _                 *   0.4 |-+                                                  **            +-|   _                 *       |                                                      **            |   _                 *       |                                                        **          |   _                 *       |                                                          *         |   _                 *   0.2 |-+                                                         **     +-|   _                 *       |                                                             **     |   _                 *       |                                                              **    |   _                 *       |             +             +            +             +         **  |   _                 *     0 +--------------------------------------------------------------------+   _                 *       0            0.2           0.4          0.6           0.8            1                    * @endverbatim5�_�                    (   J    ����                                                                                                                                                                                                                                                                                                                            (          (   1       v       ^B}�     �   '   )   2      O                 * Linear function starting at 1 and decreasing to zero atrange5�_�                    (   P    ����                                                                                                                                                                                                                                                                                                                            (          (   1       v       ^B}�     �   '   )   2      P                 * Linear function starting at 1 and decreasing to zero at range5�_�                     (   C    ����                                                                                                                                                                                                                                                                                                                            (          (   1       v       ^B}�    �   '   )   2      Q                 * Linear function starting at 1 and decreasing to zero at range.5��