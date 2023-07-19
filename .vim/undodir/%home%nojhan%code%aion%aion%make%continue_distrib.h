Vim�UnDo� ��i�� �.��:��^�w$��L���'��+�   1                                   ^y�    _�                             ����                                                                                                                                                                                                                                                                                                                                      �           V        ^y�     �             �   namespace pop {       // SIG continue's handler   void exit_process(int s)   {   W    eo::log << eo::progress << "STOP after having received SIGUSER " << s << std::endl;       exit(NO_ERROR);   }       template<class S>   eoCombinedContinue<S>& stop(           eoParser& parser,           eoState& state       )   {   9    auto& cont_true = state.pack< eoDummyContinue<S> >();   D    auto& cont_pop = state.pack< eoCombinedContinue<S> >(cont_true);           // gen-max       size_t gen_max =   C        parser.getORcreateParam(std::numeric_limits<size_t>::max(),   F            "gen-max", "Maximum number of generations (0 = disabled)",   .            'G',"Stopping criterion").value();       if(gen_max > 0) {   J        eoContinue<S>& cont_gen = state.pack< eoGenContinue<S> >(gen_max);           cont_pop.add(cont_gen);       }           // gen-steady       size_t gen_steady =   *        parser.getORcreateParam<size_t>(0,   U            "gen-steady", "Number of generations with no improvement (0 = disabled)",   /            's', "Stopping criterion").value();       // gen-min       size_t gen_min =   %        parser.createParam<size_t>(1,   7            "gen-min", "Minimum number of generations",   /            'g', "Stopping criterion").value();       if(gen_steady > 0) {   $        eoContinue<S>& cont_steady =   F            state.pack< eoSteadyFitContinue<S> >(gen_min, gen_steady);   "        cont_pop.add(cont_steady);       }           // fitness-target   )    eoValueParam<double>& param_fitness =   '        parser.createParam<double>(0.0,   t            "fitness-target", "Stop when fitness reaches the given value (enabled only when argument is specified)",   '            'F', "Stopping criterion");   )    if(parser.isItThere(param_fitness)) {   X        eoContinue<S>& cont_fit = state.pack< eoFitContinue<S> >(param_fitness.value());           cont_pop.add(cont_fit);         }           // time-max       size_t seconds =   *        parser.getORcreateParam<size_t>(0,   c            "time-max", "Stop when the program ran for the given number of seconds (0 = disabled)",   /            'T', "Stopping criterion").value();       if(seconds > 0) {   V        eoContinue<S>& cont_time = state.pack< eoSecondsElapsedContinue<S> >(seconds);            cont_pop.add(cont_time);       }           // signal       unsigned short sigusr =   -        parser.createParam<unsigned short>(0,   �            "signal-stop", "Stop when the program receive a SIGUSR signal (see `man 7 signal` for the values, generally 10,12,16,17,30,31, 0 = disabled)",   /            'S', "Stopping criterion").value();       if(sigusr > 0) {   Z        eoContinue<S>& cont_signal = state.pack< eoSIGContinue<S> >(sigusr, exit_process);   "        cont_pop.add(cont_signal);       }           if(cont_pop.size() == 0) {   p        eo::log << eo::warnings << "WARNING no stopping criterion was specified, will run forever" << std::endl;       }           return cont_pop;   }           template<class S>   std::tuple<       eoCheckPoint<S>*,       eoBestIndividualStat<S>*   >       checkpoint(           eoParser& parser,           eoState& state,           eoContinue<S>& cont       )   {   F    eoCheckPoint<S>& checkpoint = state.pack< eoCheckPoint<S> >(cont);       (    // Always remember the best solution   P    eoBestIndividualStat<S>& best_sol = state.pack< eoBestIndividualStat<S> >();       checkpoint.add(best_sol);           // Printed statistics   C    eoValueParam<size_t>& param_mon = parser.createParam<size_t>(0,   �        "monitor-stats", "Print best/median/IQR statistics every given seconds when --verbose >= progress (argument specified = enabled, 0 = every generation)",           'm', "Monitoring");   %    if(parser.isItThere(param_mon)) {   L	    eoMonitor& monitor = state.pack< eoLogMonitor >(eo::log, eo::progress);       E        auto& stat_best = state.pack< eoBestFitnessStat<S> >("best");   "        checkpoint.add(stat_best);           monitor.add(stat_best);       M        auto& stat_median = state.pack< eoNthElementStat<S> >(0.5, "median");   $        checkpoint.add(stat_median);   !        monitor.add(stat_median);       J        auto& stat_IQR = state.pack< eoInterquartileRangeStat<S> >("IQR");   !        checkpoint.add(stat_IQR);           monitor.add(stat_IQR);       $        if(param_mon.value() == 0) {   $            checkpoint.add(monitor);           } else {   M            auto& mon_time = state.pack< eoTimedMonitor >(param_mon.value());   "            mon_time.add(monitor);   %            checkpoint.add(mon_time);   	        }       }       3    return std::make_tuple(&checkpoint, &best_sol);   }       } // pop5�_�                             ����                                                                                                                                                                                                                                                                                                                                                 V        ^y�    �                 5��