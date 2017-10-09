class ordering {
  # include the ordering::mysql class
  # Does it need to be contained?

#  notify { 'This should come after the entire MySQL class is enforced':
#    require => Class['ordering::mysql'],
#  }
    

      contain ordering::mysql

      notify { 'This should come after the entire MySQL class is enforced':
        require => Class['ordering::mysql'],
      }
    }

}
