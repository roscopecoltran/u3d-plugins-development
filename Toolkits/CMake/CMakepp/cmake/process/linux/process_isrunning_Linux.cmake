
function(process_isrunning_Linux handle)
  process_handle("${handle}")
  ans(handle)
  map_tryget(${handle} pid)
  ans(pid)
  linux_ps_info(${pid} pid)
  ans(val)
  if(NOT "${val}_" STREQUAL "${pid}_")
    return(false)
  endif()
  return(true)
endfunction()