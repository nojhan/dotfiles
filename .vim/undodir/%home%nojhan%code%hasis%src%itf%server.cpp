Vim�UnDo� 8�2~�M>4;�zL�}����B+�fp�nX��}�  2                                   ^�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             ^�    �  &  (          U    boost::shared_ptr<TProtocolFactory>      protocol (new TBinaryProtocolFactory());�  %  '          X    boost::shared_ptr<TTransportFactory>     transport(new TBufferedTransportFactory());�  $  &          Y    boost::shared_ptr<TServerTransport>      socket   (new TServerSocket( server_port ));�  #  %          e    boost::shared_ptr<TProcessor>            processor(new swarms::PlannerServiceProcessor(handler));�               4    boost::shared_ptr<PathPlanServer> handler  (new �              4    boost::shared_ptr<PathPlanServer> handler  (new 5��