Vim�UnDo� (�����YY�IB	���ꭹ��nS6Z�<�Y�   "                 *       *   *   *    _���    _�                             ����                                                                                                                                                                                                                                                                                                                                                             _��     �                   �               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       _��     �               #include <aegis/io.h>5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V        _��     �             	   #include <aegis/utils.h>   #include <aegis/quotation.h>   #include <aegis/geo/plan.h>   #include <aegis/geo/cuboid.h>   #include <aegis/geo/morphism.h>   !#include <aegis/geo/projection.h>   "#include <aegis/motion/dijkstra.h>   !#include <aegis/sensor/network.h>    #include <aegis/sensor/camera.h>5�_�                    	        ����                                                                                                                                                                                                                                                                                                                                                 V        _��    �   	                �   	      
    5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                 V        _��     �   	             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V        _��1     �                5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                 V        _��6     �                       {},5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                 V        _��8     �             �             5�_�      
           	      	    ����                                                                                                                                                                                                                                                                                                                                                 V        _��:     �                       {0,0},5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                 V        _��:     �                       {1,0},5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                 V        _��<     �             �             5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                 V        _��>     �                       {1,1},5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V        _��@     �                       {2,1},5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                 V        _��Q     �                       {1,1},5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                 V        _��S     �                       {2,2},5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V        _��U     �                       {0,2},5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V        _���     �                       {2,2},5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V        _���    �                       {3,5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V        _���     �                   �             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V        _���     �                   for(auto p : aehis::5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V        _���     �                   for(auto p : aegis::5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V        _���     �                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v        _���     �               *    for(auto p : aegis::make_tour(path)) {5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v        _���     �                       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v        _���     �               +    for(auto p : aegis::make_track(path)) {5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v        _���     �                       std::cout << 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v        _���     �                        std::cout << v[0] << ","5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v        _���     �                        std::cout << v[0] << ";"5�_�                       "    ����                                                                                                                                                                                                                                                                                                                                                 v        _���     �               #        std::cout << v[0][0] << ";"5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                 v        _���     �               #        std::cout << v[0][0] << ","5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v        _���     �                                 << ";$"5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                                 v        _���    �                                 << ";"5�_�       "           !   
        ����                                                                                                                                                                                                                                                                                                                                                 v        _���    �   	   
           5�_�   !   #           "          ����                                                                                                                                                                                                                                                                                                                                                v       _��Y     �               .        std::cout << v[0][0] << "," << v[0][1]5�_�   "   $           #      +    ����                                                                                                                                                                                                                                                                                                                               +          -       v   -    _��`     �               1        std::cout << v.first[0] << "," << v[0][1]5�_�   #   %           $      +    ����                                                                                                                                                                                                                                                                                                                               +          -       v   -    _��d     �               3        std::cout << v.first[0] << "," << vfirst[1]5�_�   $   &           %          ����                                                                                                                                                                                                                                                                                                                                                v       _��h     �               -                  << v[1][0] << "," << v[1[1]5�_�   %   '           &      .    ����                                                                                                                                                                                                                                                                                                                                                v       _��l    �               1                  << v.second[0] << "," << v[1[1]5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                                                v       _��w    �                                  << std:::endl;5�_�   '   )           (          ����                                                                                                                                                                                                                                                                                                                                                 v       _���     �                    }�             5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                         !       v   !    _���     �         !      +    for(auto v : aegis::make_track(path)) {5�_�   )               *          ����                                                                                                                                                                                                                                                                                                                                         !       v   !    _���    �         !    5��