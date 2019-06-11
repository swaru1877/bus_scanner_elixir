def formatter date, format
  date.strftime format
end

def which_arg args, key
  "$#{args[key.to_s]}"
end

def resolver val
  return val unless val.include?SECRETS_RESOLVER
  eval "SECRETS.#{val.sub SECRETS_RESOLVER, ''}"
end
