Vim�UnDo� V·���g���Fr!u��'�ʈh#�^�
r�   �   B        Line pixels_line( float i1, float j1, float i2, float j2);   �   @                           ^bPq    _�                             ����                                                                                                                                                                                                                                                                                                                                                             ^S�.     �                   �               5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                             ^S�J     �   
            �   
            5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             ^S�M     �   	      �          �   	      �    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             ^S�S    �   �                      �   �            5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             ^S�_    �   �   �   �    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             ^S��     �   �   �   �    �   �   �   �    5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                             ^S��     �   �   �          }�   �   �              return pixels;�   �   �              } // scanline�   �   �                  DBGLOG(show(pixels));�   �   �          	        }�   �   �                       pixels.push_back(p);�   �   �                   if(pixels.back() != p) {�   �   �          @        line::Pix p = {{line::row(*icurr),line::col(*icurr)},1};�   �   �          O        // Always fill the last pixel, in case the scanline was aligned pixels.�   �   �                  } // icurr�   �   �                      fill = not fill;�   �   �                      icurr++;inext++;�   �   �                      } // fill�   �   �                          } // j�   �   �          (                    pixels.push_back(p);�   �   �          <                    line::Pix p = {{line::row(*icurr),j},1};�   �   �          C                    assert(line::row(*icurr) == line::row(*inext));�   �   �          N                for(size_t j=line::col(*icurr); j <= line::col(*inext); ++j) {�   �   �                      if(fill) {�   �   �          (        while(inext != scanline.end()) {�   �   �          .        // Scan line: fill one edge every two.�   �   �          $        auto inext = icurr; inext++;�   �   �          &        auto icurr = scanline.begin();�   �   �          ;        bool fill = true; // Always fill the first segment.�   �   �          8        std::set<line::Pix,RowCmp> scanline = kv.second;�   �   �          #        // Rows are already sorted.�   �   �               for( auto&& kv : buckets ) {�   �   �              // Rasterize face.�   �   �              } // edge�   �   �                  } // pixel�   �   �                      }�   �   �          )                buckets[i].insert(pixel);�   �   �                      } else {�   �   �          -                buckets[i] = Bucket({pixel});�   �   �          '            if(buckets.count(i) == 0) {�   �   �          (            size_t i = line::row(pixel);�   �   �          )        for( const auto& pixel : line ) {�   �   �                  DBGLOG(show(line));�   �   �          9        auto line  = pixels_line( u[0],u[1], v[0],v[1] );�   �   �                  // Rasterize edge.�   �   �                  auto v = edge.second;�   �   �                  auto u = edge.first;�   �   �          2    for( const auto& edge : make_tour(polygon) ) {�   �   �          $    std::map<size_t,Bucket> buckets;�   �   �          .    using Bucket = std::set<line::Pix,RowCmp>;�   �   �              // Rasterize contour.�   �   �          "    std::vector<line::Pix> pixels;�   �   �          {�   �   �          4    const std::vector<std::vector<size_t>>& polygon)�   �   �          !std::vector<line::Pix> rasterize(�   �   �          };�   �   �              }�   �   �          /        return line::col(lhs) < line::col(rhs);�   �   �              {�   �   �          E    bool operator()(const line::Pix& lhs, const line::Pix& rhs) const�   �   �          {�   �   �          struct RowCmp5�_�      	              �       ����                                                                                                                                                                                                                                                                                                                                                             ^S��     �   �   �          8            // std::vector<line::Pix> rasterize_polygon(   C            //     const std::vector<std::vector<float>>& polygon);5�_�      
           	   �   	    ����                                                                                                                                                                                                                                                                                                                                                             ^S�      �   �   �   �      	        }5�_�   	              
   �       ����                                                                                                                                                                                                                                                                                                                                                             ^S�     �   �   �   �                  }5�_�   
                 �        ����                                                                                                                                                                                                                                                                                                                                                             ^S�    �   �   �           5�_�                    �       ����                                                                                                                                                                                                                                                                                                                                                             ^S�     �   �   �   �    5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       ^S�/     �   �   �                          {   ;                    return line::col(lhs) < line::col(rhs);                   }5�_�                    �   Q    ����                                                                                                                                                                                                                                                                                                                            �          �          V       ^S�0     �   �   �   �      Q                bool operator()(const line::Pix& lhs, const line::Pix& rhs) const5�_�                    �       ����                                                                                                                                                                                                                                                                                                                            �          �          V       ^S�3     �   �   �       9               {   .                std::vector<line::Pix> pixels;       %                // Rasterize contour.   :                using Bucket = std::set<line::Pix,RowCmp>;   0                std::map<size_t,Bucket> buckets;       >                for( const auto& edge : make_tour(polygon) ) {   (                    auto u = edge.first;   )                    auto v = edge.second;       &                    // Rasterize edge.   E                    auto line  = pixels_line( u[0],u[1], v[0],v[1] );   '                    DBGLOG(show(line));       5                    for( const auto& pixel : line ) {   4                        size_t i = line::row(pixel);   3                        if(buckets.count(i) == 0) {   9                            buckets[i] = Bucket({pixel});                            } else {   5                            buckets[i].insert(pixel);                           }                       } // pixel                   } // edge       "                // Rasterize face.   ,                for( auto&& kv : buckets ) {   /                    // Rows are already sorted.   D                    std::set<line::Pix,RowCmp> scanline = kv.second;       G                    bool fill = true; // Always fill the first segment.   2                    auto icurr = scanline.begin();   0                    auto inext = icurr; inext++;       :                    // Scan line: fill one edge every two.   4                    while(inext != scanline.end()) {   "                        if(fill) {   Z                            for(size_t j=line::col(*icurr); j <= line::col(*inext); ++j) {   O                                assert(line::row(*icurr) == line::row(*inext));   H                                line::Pix p = {{line::row(*icurr),j},1};   4                                pixels.push_back(p);   "                            } // j   !                        } // fill   (                        icurr++;inext++;   (                        fill = not fill;                       } // icurr       [                    // Always fill the last pixel, in case the scanline was aligned pixels.   L                    line::Pix p = {{line::row(*icurr),line::col(*icurr)},1};   ,                    if(pixels.back() != p) {   ,                        pixels.push_back(p);                       }   )                    DBGLOG(show(pixels));                   } // scanline                       return pixels;               }5�_�                    �   D    ����                                                                                                                                                                                                                                                                                                                            �          �          V       ^S�5    �   �   �   �      D                    const std::vector<std::vector<size_t>>& polygon)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       ^S��     �                        namespace line {5�_�                    *       ����                                                                                                                                                                                                                                                                                                                            *          *          V       ^S��     �   )   +                  } // line5�_�                           ����                                                                                                                                                                                                                                                                                                                            *          *          V       ^S��     �   
      �          namespace raster {�         �    5�_�                           ����                                                                                                                                                                                                                                                                                                                            *          *          V       ^S��     �         �          namespace raster {�         �    5�_�                           ����                                                                                                                                                                                                                                                                                                                            *          *          V       ^S��     �         �          namespace raster {�         �    5�_�                           ����                                                                                                                                                                                                                                                                                                                            *          *          V       ^S��     �         �          namespace raster {�         �    5�_�                           ����                                                                                                                                                                                                                                                                                                                            *          *          V       ^S��    �         �          namespace raster {�         �    5�_�                    �        ����                                                                                                                                                                                                                                                                                                                            *          *          V       ^S��    �   �   �           5�_�                    
        ����                                                                                                                                                                                                                                                                                                                            *          *          V       ^S�u    �   	   
           5�_�                            ����                                                                                                                                                                                                                                                                                                                            )          )          V       ^S��     �                  5�_�                           ����                                                                                                                                                                                                                                                                                                                                                       ^S��     �          �      #ifndef __AEGIS__H__�          �      #ifndef __AEGIS_CARTO_H__   #define __AEGIS_CARTO_H__5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                       ^S��    �   �               �   �            5�_�                    +        ����                                                                                                                                                                                                                                                                                                                                                       ^S��   	 �   �   �          -            std::vector<line::Pix> rasterize(�   �   �          R                bool operator()(const line::Pix& lhs, const line::Pix& rhs) const;�   *   ,          ,        using Line = std::vector<line::Pix>;5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ^_�     �         �    5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             ^_�   
 �         �       5�_�                      �   @    ����                                                                                                                                                                                                                                                                                                                                                             ^bPp    �   �   �   �      B        Line pixels_line( float i1, float j1, float i2, float j2);5��