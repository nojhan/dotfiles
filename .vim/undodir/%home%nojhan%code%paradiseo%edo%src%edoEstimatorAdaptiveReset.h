Vim�UnDo� Z\X��:�ai}ɒ"~v�~��%��@4�A�#E0P   @   (        edoEstimatorAdaptive<D>(distrib)   -   (      9       9   9   9    ^���    _�                            ����                                                                                                                                                                                                                                                                                                                                                             ^z      �                4    Pierre Savéant <pierre.saveant@thalesgroup.com>5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^z      �         9      Copyright (C) 2010 Thales group5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^z      �         9      #ifndef _edoEstimatorAdaptive_h5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^z      �         9      #define _edoEstimatorAdaptive_h5�_�                    9        ����                                                                                                                                                                                                                                                                                                                                                             ^z     �   8              "#endif // !_edoEstimatorAdaptive_h5�_�                    1       ����                                                                                                                                                                                                                                                                                                                            1          1          V       ^z     �   0   2          K    // virtual D operator() ( eoPop< EOT >& )=0 (provided by eoUF< A1, R >)5�_�                    1   *    ����                                                                                                                                                                                                                                                                                                                            1          1          V       ^z     �   0   5   9      H    virtual D operator() ( eoPop< EOT >& )=0 (provided by eoUF< A1, R >)5�_�      	              3        ����                                                                                                                                                                                                                                                                                                                            1          1          V       ^z     �   2   4   <       5�_�      
           	   *   0    ����                                                                                                                                                                                                                                                                                                                            1          1          V       ^z'     �   )   +   <      3class edoEstimatorAdaptive : public edoEstimator<D>5�_�   	              
   6       ����                                                                                                                                                                                                                                                                                                                            1          1          V       ^z-     �   5   6          1    D & distribution() const { return _distrib; }5�_�   
                 6        ����                                                                                                                                                                                                                                                                                                                            1          1          V       ^z-     �   5   6           5�_�                    6        ����                                                                                                                                                                                                                                                                                                                            1          1          V       ^z-     �   5   6          
protected:5�_�                    6       ����                                                                                                                                                                                                                                                                                                                            1          1          V       ^z.     �   5   6              D & _distrib;5�_�                    3       ����                                                                                                                                                                                                                                                                                                                            1          1          V       ^z0     �   2   4   8              _distrib.reset();5�_�                    /       ����                                                                                                                                                                                                                                                                                                                            1          1          V       ^z9     �   .   /          @    edoEstimatorAdaptive<D>( D& distrib ) : _distrib(distrib) {}5�_�                    /        ����                                                                                                                                                                                                                                                                                                                            0          0          V       ^z:    �   .   /           5�_�                    *       ����                                                                                                                                                                                                                                                                                                                            /          /          V       ^z>    �   )   +   6      ;class edoEstimatorAdaptive : public edoEstimatorAdaptive<D>5�_�                    )       ����                                                                                                                                                                                                                                                                                                                            /          /          V       ^zC    �   (   *   6      template < typename D >5�_�                    '       ����                                                                                                                                                                                                                                                                                                                            /          /          V       ^zJ     �   &   '           * @ingroup Core5�_�                    #       ����                                                                                                                                                                                                                                                                                                                            #          $   $       v   $    ^zT     �   "   $   4      /** �   "   $   5      F/** An interface that explicits the needs for a permanent distribution   % * that will be updated by operators.5�_�                    #   +    ����                                                                                                                                                                                                                                                                                                                            #          #   (       v   $    ^zi     �   "   $   4      +/** An estimator that calls `reset` on the 5�_�                    -       ����                                                                                                                                                                                                                                                                                                                            #          #   (       v   $    ^zq     �   ,   /   5          �   ,   .   4    5�_�                    -        ����                                                                                                                                                                                                                                                                                                                            #          #   (       v   $    ^zr     �   ,   .   6       5�_�                    -       ����                                                                                                                                                                                                                                                                                                                            #          #   (       v   $    ^z�     �   -   /   6    �   -   .   6    5�_�                    -       ����                                                                                                                                                                                                                                                                                                                            #          #   (       v   $    ^z�     �   ,   -              edoEstimatorAdaptiveReset(5�_�                    -       ����                                                                                                                                                                                                                                                                                                                            #          #   (       v   $    ^z�     �   ,   .   6      @    edoEstimatorAdaptive<D>( D& distrib ) : _distrib(distrib) {}5�_�                    -   9    ����                                                                                                                                                                                                                                                                                                                            #          #   (       v   $    ^z�    �   ,   .   6      E    edoEstimatorAdaptiveReset<D>( D& distrib ) : _distrib(distrib) {}5�_�                    1       ����                                                                                                                                                                                                                                                                                                                            #          #   (       v   $    ^z�    �   1   3   7              �   1   3   6    5�_�                    !       ����                                                                                                                                                                                                                                                                                                                            #          #   (       v   $    ^z�     �       "   7      #include "edoEstimator.h"5�_�                            ����                                                                                                                                                                                                                                                                                                                            #          #   (       v   $    ^z�   	 �                #include <eoFunctor.h>5�_�                     .   %    ����                                                                                                                                                                                                                                                                                                                                                             ^z     �   -   /   6      *    virtual D operator() ( eoPop< EOT >& )5�_�      !               .   "    ����                                                                                                                                                                                                                                                                                                                                                             ^z   
 �   -   /   6      ,    virtual D operator() ( eoPop< EOType>& )5�_�       "           !   1       ����                                                                                                                                                                                                                                                                                                                                                             ^z*    �   0   2   6              return distrib;5�_�   !   #           "   &       ����                                                                                                                                                                                                                                                                                                                                                             ^z~     �   %   '   6      template < typename D >5�_�   "   $           #   &       ����                                                                                                                                                                                                                                                                                                                                                             ^z�     �   %   '   6      template < class D >5�_�   #   %           $   &   	    ����                                                                                                                                                                                                                                                                                                                                                             ^z�     �   %   '   6      template <class D >5�_�   $   &           %   &       ����                                                                                                                                                                                                                                                                                                                                                             ^z�    �   %   '   6      template<class D >5�_�   %   '           &   ,   +    ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   ,   .   6    �   ,   -   6    5�_�   &   (           '   -   ,    ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   ,   .   7      T    edoEstimatorAdaptiveReset<D>( D& distrib ) : edoEstimatorAdaptive<D>(distrib) {}5�_�   '   )           (   ,   1    ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   +   .   7      T    edoEstimatorAdaptiveReset<D>( D& distrib ) : edoEstimatorAdaptive<D>(distrib) {}5�_�   (   *           )   -   )    ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   ,   /   8      +        edoEstimatorAdaptive<D>(distrib) {}5�_�   )   +           *   .       ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   -   /   9          {}5�_�   *   ,           +   .       ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   -   0   9          { }5�_�   +   -           ,   0   =    ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   /   2   :      `    edoEstimatorAdaptiveReset<D>( D& distrib, size_t dim ) : edoEstimatorAdaptive<D>(distrib) {}5�_�   ,   .           -   1   )    ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   0   3   ;      +        edoEstimatorAdaptive<D>(distrib) {}5�_�   -   /           .   2       ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   1   3   <          {}5�_�   .   0           /   9        ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   8   <   <       5�_�   /   1           0   ,   0    ����                                                                                                                                                                                                                                                                                                                                                             ^�     �   +   .   >      0    edoEstimatorAdaptiveReset<D>( D& distrib ) :5�_�   0   2           1   1   <    ����                                                                                                                                                                                                                                                                                                                                                             ^�     �   0   3   ?      <    edoEstimatorAdaptiveReset<D>( D& distrib, size_t dim ) :5�_�   1   3           2   8       ����                                                                                                                                                                                                                                                                                                                                                             ^�    �   7   9   @              this->_distrib.reset();5�_�   2   4           3   6       ����                                                                                                                                                                                                                                                                                                                                                             ^�
-    �   5   7   @      +    virtual D operator() ( eoPop<EOType>& )5�_�   3   5           4   2       ����                                                                                                                                                                                                                                                                                                                                                             ^���     �   1   2   A              _dim(dim),�   3   5   @    5�_�   4   6           5   2   (    ����                                                                                                                                                                                                                                                                                                                                                             ^���     �   1   3   @      (        edoEstimatorAdaptive<D>(distrib)5�_�   5   7           6   3       ����                                                                                                                                                                                                                                                                                                                                                             ^���     �   2   4   @              _dim(dim),5�_�   6   8           7   -       ����                                                                                                                                                                                                                                                                                                                                                             ^���     �   ,   -   A              _dim(0),�   .   0   @    5�_�   7   9           8   .       ����                                                                                                                                                                                                                                                                                                                                                             ^���     �   -   /   @              _dim(0),5�_�   8               9   -   (    ����                                                                                                                                                                                                                                                                                                                                                             ^���    �   ,   .   @      (        edoEstimatorAdaptive<D>(distrib)5��