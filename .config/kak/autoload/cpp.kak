hook global WinSetOption filetype=(cpp) %[
    require-module c-family
    evaluate-commands %sh{
        # Grammar
        flow='
            break case catch
              continue do 
              else for goto if 
              return switch
              throw try while
              assert static_assert ASSERT
        '
        state='
            alignas alignof asm compl const_cast decltype
              delete dynamic_cast export new operator reinterpret_cast
              sizeof static_cast typeid
        '
        operators='
            and and_eq bitand bitor not not_eq or or_eq xor xor_eq
            '
        attributes='
            audit axiom const consteval constexpr default explicit
            extern final friend inline mutable noexcept override private
            protected public register requires static thread_local typename
            virtual volatile
        '
        entities='auto class concept enum namespace struct template union typedef using'
        types='
           bool byte char char8_t char16_t char32_t double float int long
           max_align_t nullptr_t ptrdiff_t short signed size_t size_type unsigned void
           wchar_t uint32_t critical error warning progress note info debug xdebug
        '
        values='NULL false nullptr this true CLUTCHLOG CLUTCHLOGD CLUTCHCODE CLUTCHFUNC'

        STL='
           abort abs accumulate acos adjacent_difference adjacent_find adjacent_find_if any append
           asctime asin assign at atan atan2 atexit atof atoi atol auto_ptr back back_inserter bad bad_alloc
           bad_cast bad_exception bad_typeid badbit beg begin binary_compose binary_negate binary_search bind2nd
           binder1st binder2nd bitset bsearch c_str calloc capacity ceil cerr cin clear clearerr clock clog
           close compare compose1 compose2 const_iterator construct copy copy_backward copy_n cos cosh count
           count_if cout ctime data deque destroy difference_type difftime div divides domain_error empty end
           endl eof eofbit equal equal_range erase exception exit exp fabs fail failbit failure fclose feof
           ferror fflush fgetc fgetpos fgets fill fill_n find find_end find_first_not_of find_first_of find_if
           find_last_not_of find_last_of first flags flip floor flush fmod fopen for_each fprintf fputc fputs
           fread free freopen frexp front fscanf fseek fsetpos fstream ftell fwrite gcount generate generate_n
           get get_temporary_buffer getc getchar getenv getline gets gmtime good goodbit greater greater_equal
           hash_map hash_multimap hash_multiset hash_set ifstream ignore in includes inner_product inplace_merge
           insert inserter invalid_argument ios ios_base iostate iota is_heap is_open is_sorted isalnum isalpha
           iscntrl isdigit isgraph islower isprint ispunct isspace istream istream_iterator istringstream
           isupper isxdigit iter_swap iterator iterator_category key_comp ldiv length length_error less
           less_equal lexicographical_compare lexicographical_compare_3way list localtime log log10 logic_error
           logical_and logical_not logical_or longjmp lower_bound make_heap malloc map max max_element max_size
           mem_fun mem_fun1 mem_fun1_ref mem_fun_ref memchr memcpy memmove memset merge min min_element minus
           mismatch mktime modf modulus multimap multiplies multiset negate next_permutation npos nth_element
           numeric_limits ofstream open ostream ostream_iterator ostringstream out_of_range overflow_error
           pair make_pair partial_sort partial_sort_copy partial_sum partition peek perror plus pointer
           pointer_to_binary_function pointer_to_unary_function pop pop_back pop_front pop_heap pow power
           precision prev_permutation printf ptr_fun push push_back push_front push_heap put putback putc
           putchar puts qsort raise rand random_sample random_sample_n random_shuffle range_error rbegin
           rdbuf rdstate read realloc ref reference remove remove_copy remove_copy_if remove_if rename rend
           replace replace_copy replace_copy_if replace_if reserve reset resize return_temporary_buffer
           reverse reverse_copy reverse_iterator rewind rfind rotate rotate_copy runtime_error scanf search
           search_n second seekg seekp set set_difference set_intersection set_symmetric_difference set_union
           setbuf setf setjmp setlocale setvbuf shared_ptr signal sin sinh size sort sort_heap splice
           sprintf sqrt srand sscanf stable_partition stable_sort std str strcat strchr strcmp strcoll strcpy
           strcspn strerror strftime string strlen strncat strncmp strncpy strpbrk strrchr strspn strstr strtod
           strtok strtol strtoul strxfrm substr swap swap_ranges sync_with_stdio system tan tanh tellg tellp
           temporary_buffer test time time_t tmpfile tmpnam to_string to_ulong tolower top toupper transform
           unary_compose unary_negate underflow_error unget ungetc uninitialized_copy uninitialized_copy_n
           uninitialized_fill uninitialized_fill_n unique unique_ptr unique_copy unsetf upper_bound va_arg value_comp
           value_type vector vfprintf vprintf vsprintf width write round initializer_list function make_unique
           make_shared forward filesystem
       '
        join() { sep=$2; eval set -- $1; IFS="$sep"; echo "$*"; }

        # Add the language's grammar to the static completion list
        printf %s\\n "declare-option str-list cpp_static_words $(join "${flow} ${state} ${operators} ${attributes} ${entities} ${types} ${values} ${STL}" ' ')"

        # Highlight keywords
        printf %s "
            add-highlighter -override shared/cpp/code/flow        regex \b($(join "${flow}" '|'))\b       0:flow
            add-highlighter -override shared/cpp/code/state       regex \b($(join "${state}" '|'))\b      0:state
            add-highlighter -override shared/cpp/code/attributes  regex \b($(join "${attributes}" '|'))\b 0:attribute
            add-highlighter -override shared/cpp/code/entities    regex \b($(join "${entities}" '|'))\b   0:entity
            add-highlighter -override shared/cpp/code/types       regex \b($(join "${types}" '|'))\b      0:type
            add-highlighter -override shared/cpp/code/values      regex \b($(join "${values}" '|'))\b     0:value
            add-highlighter -override shared/cpp/code/STL         regex \bstd::[\w:]*\b                   0:builtin
            add-highlighter -override shared/cpp/code/operators1  regex \b($(join "${operators}" '|'))\b  0:operator
            add-highlighter -override shared/cpp/code/operators2  regex (\+|-|\*|&|=|\\|\?|%|\|-|!|\||->|\.|,|<|>|:|\^|/|~) 0:operator
            add-highlighter -override shared/cpp/code/delimiters  regex (\(|\)|\[|\]|\{|\}|\;|')          0:delimiter
        "
    }
]
