Vim�UnDo� �(FV��٧���'U�"�3sٷ��|a;+*ܒ�  �       os << "Where:"<<endl;  R                          ^�/�    _�                     d       ����                                                                                                                                                                                                                                                                                                                            d          d   '       v   '    ^}2�     �   c   e  �      )                throw runtime_error(msg);5�_�                    c       ����                                                                                                                                                                                                                                                                                                                            c          c          V       ^}2�    �   b   d          L                string msg = string("Could not open response file: ") + pts;5�_�                    P       ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   O   Q  �      ?                     string _lFileParamName, char _shortHand) :5�_�                    P   -    ����                                                                                                                                                                                                                                                                                                                                                             ^���    �   O   Q  �      A                     string /*_lFileParamName, char _shortHand) :5�_�                    P   6    ����                                                                                                                                                                                                                                                                                                                                                             ^���     �   O   Q  �      C                     string /*_lFileParamName*/, char _shortHand) :5�_�                    P   B    ����                                                                                                                                                                                                                                                                                                                                                             ^���    �   O   Q  �      E                     string /*_lFileParamName*/, char /*_shortHand) :5�_�                    -        ����                                                                                                                                                                                                                                                                                                                            -           -           V        ^�.2    �   ,   .          using namespace std;5�_�      	              /        ����                                                                                                                                                                                                                                                                                                                                                             ^�.�    �  �  �          S            string msg = "Use -h or --help to get help about available parameters";�  �  �          M              string msg = "Unknown parameter: -" + entryString + " entered";�  �  �          +              string entryString(1, entry);�  �  �          H              string msg = "Unknown parameter: --" + entry + " entered";�  �  �          $          string entry = lIt->first;�  ^  `          *        std::string newSection = p->first;�  W  Y          #    std::string section = p->first;�  D  F          X        std::copy(messages.begin(), messages.end(), ostream_iterator<string>(os, "\n"));�  -  /          H        string str = "--" + param->longName() + "=" + param->getValue();�     "          *        std::string newSection = p->first;�              #    std::string section = p->first;�    	          G                            value = string(str.begin() + 2, str.end());�              K                                value = string(str.begin() + 3, str.end());�   �   �          F                    string value = "1"; // flags do not need a special�   �   �          @                    string name(str.begin() + 2, equalLocation);�   �   �          E                        value = string(equalLocation + 1, str.end());�   �   �          <                    { //! @todo it should be the next string�   �   �          !                    string value;�   �   �          [                    string::iterator equalLocation = find(str.begin() + 2, str.end(), '=');�   �   �                          string tempStr;�   �   �          A            processing = (str.find(string("Parser"))<str.size());�   �   �          E        if (str.find(string("\\section{"))==0) // found section begin�   �   �              string str;�   �   �          Q    map<string, string>::const_iterator it = longNameMap.find(_param.longName());�   �   �          U        map<char, string>::const_iterator it = shortNameMap.find(_param.shortName());�   �   �          )    pair<bool, string> result(false, "");�   �   �          <pair<bool, string> eoParser::getValue(eoParam& _param) const�   �   �          /    pair<bool, string> value = getValue(param);�   �   �          L        string msg = "Required parameter: " + param.longName() + " missing";�   �   �          @void eoParser::processParam(eoParam& param, std::string section)�   �   �          <eoParam * eoParser::getParam(const std::string& _name) const�   �   �          %    std::string search(prefix+_name);�   ~   �          >    typedef std::multimap<std::string, eoParam*> MultiMapType;�   |   ~          HeoParam * eoParser::getParamWithLongName(const std::string& _name) const�   v   x          :std::string eoParser::get( const std::string & name) const�   b   d          O                // string msg = string("Could not open response file: ") + pts;�   O   Q          G                     string /*_lFileParamName*/, char /*_shortHand*/) :�   N   P          OeoParser::eoParser ( unsigned _argc, char **_argv , string _programDescription,�   .   0          Gstd::ostream& printSectionHeader(std::ostream& os, std::string section)5�_�      
           	   �        ����                                                                                                                                                                                                                                                                                                                                                             ^�.�    �  �  �          >istream & operator>>(istream & _is,  eoParamParamType & _rate)�   �   �          $void eoParser::readFrom(istream& is)5�_�   	              
   _        ����                                                                                                                                                                                                                                                                                                                                                             ^�.�    �   ^   `                      ifstream ifs (pts);5�_�   
                 l        ����                                                                                                                                                                                                                                                                                                                                                             ^�.�    �   k   m              stringstream stream;5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                             ^�.�   	 �   �   �          [    map<std::string, std::string>::const_iterator it = longNameMap.find(_param.longName());�   �   �          Z        map<char, std::string>::const_iterator it = shortNameMap.find(_param.shortName());5�_�                    /        ����                                                                                                                                                                                                                                                                                                                                                             ^�/   
 �  ^  `          /        std::std::string newSection = p->first;�  W  Y          (    std::std::string section = p->first;�     "          /        std::std::string newSection = p->first;�              (    std::std::string section = p->first;�   �   �          Evoid eoParser::processParam(eoParam& param, std::std::string section)�   �   �          AeoParam * eoParser::getParam(const std::std::string& _name) const�   �   �          *    std::std::string search(prefix+_name);�   ~   �          C    typedef std::multimap<std::std::string, eoParam*> MultiMapType;�   |   ~          MeoParam * eoParser::getParamWithLongName(const std::std::string& _name) const�   v   x          Dstd::std::string eoParser::get( const std::std::string & name) const�   .   0          Lstd::ostream& printSectionHeader(std::ostream& os, std::std::string section)5�_�                    �        ����                                                                                                                                                                                                                                                                                                                                                             ^�/    �   �   �          .    pair<bool, std::string> result(false, "");�   �   �          Apair<bool, std::string> eoParser::getValue(eoParam& _param) const�   �   �          4    pair<bool, std::string> value = getValue(param);5�_�                   0       ����                                                                                                                                                                                                                                                                                                                                                             ^�/6     �  /  1  �      7        os.setf(ios_base::left, ios_base::adjustfield);5�_�                   0   %    ����                                                                                                                                                                                                                                                                                                                                                             ^�/9    �  /  1  �      <        os.setf(std::ios_base::left, ios_base::adjustfield);5�_�                   1       ����                                                                                                                                                                                                                                                                                                                                                             ^�/H     �  0  2  �      .        os << setfill(' ') << setw(40) << str;5�_�                   3       ����                                                                                                                                                                                                                                                                                                                                                             ^�/K    �  2  4  �              os << setw(0) << " # ";5�_�                    /        ����                                                                                                                                                                                                                                                                                                                                                             ^�/y    �  �  �          Costream & operator<<(ostream & _os, const eoParamParamType & _rate)�  @  B          %void eoParser::printHelp(ostream& os)�              )void eoParser::printOn(ostream& os) const�   .   0          Gstd::ostream& printSectionHeader(std::ostream& os, std::string section)5�_�                    /        ����                                                                                                                                                                                                                                                                                                                                                             ^�/�    �   .   0          Qstd::std::ostream& printSectionHeader(std::std::ostream& os, std::string section)5�_�                   1       ����                                                                                                                                                                                                                                                                                                                                                             ^�/�    �  0  2  �      3        os << setfill(' ') << std::setw(40) << str;5�_�                   E   4    ����                                                                                                                                                                                                                                                                                                                                                             ^�/�    �  D  F  �      ]        std::copy(messages.begin(), messages.end(), ostream_iterator<std::string>(os, "\n"));5�_�                   P   H    ����                                                                                                                                                                                                                                                                                                                                                             ^�/�    �  O  Q  �      M    os << "Options of the form \"-f[=Value]\" or \"--Name[=value]\"" << endl;5�_�                    R       ����                                                                                                                                                                                                                                                                                                                                                             ^�/�    �  Q  S  �          os << "Where:"<<endl;5��