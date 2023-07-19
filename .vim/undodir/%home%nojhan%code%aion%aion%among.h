Vim�UnDo� (�fH���,��X��S��_���6�Rm45˔|1�   ~   #include among.hpp"   |   	                       ^Yy�    _�                     	        ����                                                                                                                                                                                                                                                                                                                                                             ^W�N    �      	           5�_�                    A       ����                                                                                                                                                                                                                                                                                                                            @          C          V       ^YxU     �   @   A          	        {   ?            return this->_min <= value and value <= this->_max;   	        }5�_�                    @   5    ����                                                                                                                                                                                                                                                                                                                            @          A          V       ^YxX     �   ?   A   �      5        virtual bool operator()(const T& value) const5�_�                    C       ����                                                                                                                                                                                                                                                                                                                            @          A          V       ^Yxc     �   B   E   �      ,        virtual T min() const {return _min;}5�_�                    G       ����                                                                                                                                                                                                                                                                                                                            @          A          V       ^Yxg     �   F   I   �      ,        virtual T max() const {return _max;}5�_�                    D       ����                                                                                                                                                                                                                                                                                                                            C          D          V       ^Yxn     �   B   D   �              virtual T min() const�   C   E   �              {return _min;}5�_�                    H       ����                                                                                                                                                                                                                                                                                                                            G          H          V       ^Yxs     �   F   H   �              virtual T max() const�   G   I   �              {return _max;}5�_�      	              K   ,    ����                                                                                                                                                                                                                                                                                                                            G          H          V       ^Yxv     �   J   M   �      P        virtual std::pair<T,T> range() const {return std::make_pair(_min,_max);}5�_�      
           	   L       ����                                                                                                                                                                                                                                                                                                                            K          L   *       V   *    ^Yxy     �   J   L   �      ,        virtual std::pair<T,T> range() const�   K   M   �      +        {return std::make_pair(_min,_max);}5�_�   	              
   P       ����                                                                                                                                                                                                                                                                                                                            O          S          V       ^Yx{     �   N   P   �      Q        friend std::ostream& operator<<(std::ostream& out, const Range<T>& range)�   O   P          	        {   A            out << "[" << range._min << "," << range._max << "]";               return out;   	        }5�_�   
                 L       ����                                                                                                                                                                                                                                                                                                                            O          P          V       ^Yx     �   K   L                  5�_�                    H        ����                                                                                                                                                                                                                                                                                                                            N          O          V       ^Yx�     �   G   H                  5�_�                    D        ����                                                                                                                                                                                                                                                                                                                            M          N          V       ^Yx�     �   C   D                  5�_�                    8        ����                                                                                                                                                                                                                                                                                                                            8           9           V        ^Yy     �   7   8          .            : Among<T>(), _min(min), _max(max)   
        {}5�_�                    7   )    ����                                                                                                                                                                                                                                                                                                                            8           8           V        ^Yy	    �   6   8   �      )        Range(const T& min, const T& max)5�_�                    ^   3    ����                                                                                                                                                                                                                                                                                                                            ^   3       c   	       v       ^Yy0     �   ]   `   �      3        Set(std::initializer_list<value_type> set) �   ]   _   �      4        Set(std::initializer_list<value_type> set) :                Among<value_type>(),               _set(set)   	        {   $            assert(_set.size() > 0);   	        }    5�_�                    d   !    ����                                                                                                                                                                                                                                                                                                                            d   !       i          v       ^Yy7    �   c   e   �      !        Set(const CONTAINER& set)�   c   e   �      #        Set(const CONTAINER& set) :                Among<value_type>(),               _set(set)   	        {   $            assert(_set.size() > 0);   	        }5�_�                    l       ����                                                                                                                                                                                                                                                                                                                            k          o          V       ^Yy?     �   j   l   �      >        virtual bool operator()(const value_type& value) const�   k   l          	        {   9            // return _set.find(value) != std::end(_set);   X            return std::find(std::begin(_set), std::end(_set), value) != std::end(_set);   	        }5�_�                    o       ����                                                                                                                                                                                                                                                                                                                            n          q          V       ^YyB     �   m   o   �      1        const value_type& at(std::size_t i) const�   n   o          	        {               return _set.at(i);   	        }5�_�                    r       ����                                                                                                                                                                                                                                                                                                                            q          t          V       ^YyD     �   p   r   �               std::size_t size() const�   q   r          	        {               return _set.size();   	        }5�_�                    u       ����                                                                                                                                                                                                                                                                                                                            t          {          V       ^YyF    �   s   u   |      U        friend std::ostream& operator<<(std::ostream& out, const Set<CONTAINER>& set)�   t   u          	        {               out << "{";   ?            std::copy(std::begin(set._set), std::end(set._set),   A                    std::ostream_iterator<value_type>(out, ","));               out << "}";               return out;   	        }5�_�                    {        ����                                                                                                                                                                                                                                                                                                                            t          u          V       ^Yy�     �   {   ~   }       �   {   }   |    5�_�                     |   	    ����                                                                                                                                                                                                                                                                                                                            t          u          V       ^Yy�    �   {   }   ~      #include among.hpp"5��