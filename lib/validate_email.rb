# -*- encoding : utf-8 -*-
module ValidateEmail
  
  EmailRegexp = begin
    user_unsafe = '[\\x00-\\xff]'
    user_safe = '[[:alnum:]\\x21\\x23\\x24\\x25\\x26\\x27\\x2a\\x2b\\x2d\\x2f\\x3d' + 
      '\\x3f\\x5e\\x5f\\x60\\x2e\\x7b\\x7c\\x7d\\x7e]'
    user_escaped = '\\x5c' + user_unsafe
    user_quoted = "\\x22(#{user_unsafe}|#{user_escaped})+\\x22"
    user_section = "(#{user_escaped}|#{user_quoted}|#{user_safe})+"
    username = "#{user_section}(\\x2e#{user_section})*"
    domain_literal = '\\x5b[[:xdigit:]\\x2e\\x3a]+\\x5d'
    domain_section = '[[:alnum:]]+(\\x2d[[:alnum:]]+)*'
    dotted_domain = "#{domain_section}(\\x2e#{domain_section})*\\x2e?"
    domain = "(#{domain_literal}|#{dotted_domain})"
    email = "#{username}\\x40#{domain}"
    /^#{email}$/
  end
  
  UsernameRegexp = begin
    user_unsafe = '[\\x00-\\xff]'
    user_safe = '[[:alnum:]\\x21\\x23\\x24\\x25\\x26\\x27\\x2a\\x2b\\x2d\\x2f\\x3d' + 
      '\\x3f\\x5e\\x5f\\x60\\x2e\\x7b\\x7c\\x7d\\x7e]'
    user_escaped = '\\x5c' + user_unsafe
    user_quoted = "\\x22(#{user_unsafe}|#{user_escaped})+\\x22"
    user_section = "(#{user_escaped}|#{user_quoted}|#{user_safe})+"
    username = "#{user_section}(\\x2e#{user_section})*"
    /^#{username}$/
  end
  
  DomainRegexp = begin
    domain_literal = '\\x5b[[:xdigit:]\\x2e\\x3a]+\\x5d'
    domain_section = '[[:alnum:]]+(\\x2d[[:alnum:]]+)*'
    dotted_domain = "#{domain_section}(\\x2e#{domain_section})*\\x2e?"
    domain = "(#{domain_literal}|#{dotted_domain})"
    /^#{domain}$/
  end

end
