

node default{
  include package
  include adduser
  include adddirectory

  wget::fetch { "Download memory_check Script":
    source      => 'https://github.com/MacatangayEldrich/VOYAGERexam/blob/master/memory_check',
    destination => '/home/monitor/scripts',
  wget https://github.com/MacatangayEldrich/VOYAGERexam/blob/master/memory_check' -o memory_check  
  }
  
  exec{
  }
  
  file { '/home/monitor/src/memory_check':
    ensure => 'link',
    target => '/home/monitor/scripts/memory_check',
  }
  
  
  cron { 'helloworld':   
   command => "/home/monitor/scripts/memory_check",   
   hour    => '*',   
   minute  => '*/5',
   require => File['/home/monitor/scripts/memory_check']
}
  
}
