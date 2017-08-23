# returns a map of all set target properties for target
# if target does not exist it returns null
function(target_get_properties target)

  if(NOT TARGET "${target}")
    return()
  endif()
  set(props
    DEBUG_OUTPUT_NAME
    DEBUG_POSTFIX
    RELEASE_OUTPUT_NAME
    RELEASE_POSTFIX
    ARCHIVE_OUTPUT_DIRECTORY
    ARCHIVE_OUTPUT_DIRECTORY_<CONFIG>
    ARCHIVE_OUTPUT_NAME
    ARCHIVE_OUTPUT_NAME_<CONFIG>
    AUTOMOC
    AUTOMOC_MOC_OPTIONS
    BUILD_WITH_INSTALL_RPATH
    BUNDLE
    BUNDLE_EXTENSION
    COMPILE_DEFINITIONS
    COMPILE_DEFINITIONS_<CONFIG>
    COMPILE_FLAGS
    DEBUG_POSTFIX
    RELEASE_POSTFIX
    DEFINE_SYMBOL
    ENABLE_EXPORTS
    EXCLUDE_FROM_ALL
    EchoString
    FOLDER
    FRAMEWORK
    Fortran_FORMAT
    Fortran_MODULE_DIRECTORY
    GENERATOR_FILE_NAME
    GNUtoMS
    HAS_CXX
    IMPLICIT_DEPENDS_INCLUDE_TRANSFORM
    IMPORTED
    IMPORTED_CONFIGURATIONS
    IMPORTED_IMPLIB
    IMPORTED_IMPLIB_<CONFIG>
    IMPORTED_LINK_DEPENDENT_LIBRARIES
    IMPORTED_LINK_DEPENDENT_LIBRARIES_<CONFIG>
    IMPORTED_LINK_INTERFACE_LANGUAGES
    IMPORTED_LINK_INTERFACE_LANGUAGES_<CONFIG>
    IMPORTED_LINK_INTERFACE_LIBRARIES
    IMPORTED_LINK_INTERFACE_LIBRARIES_<CONFIG>
    IMPORTED_LINK_INTERFACE_MULTIPLICITY
    IMPORTED_LINK_INTERFACE_MULTIPLICITY_<CONFIG>
    IMPORTED_LOCATION
    IMPORTED_LOCATION_<CONFIG>
    IMPORTED_NO_SONAME
    IMPORTED_NO_SONAME_<CONFIG>
    IMPORTED_SONAME
    IMPORTED_SONAME_<CONFIG>
    IMPORT_PREFIX
    IMPORT_SUFFIX
    INCLUDE_DIRECTORIES
    INTERFACE_INCLUDE_DIRECTORIES
    INTERFACE_SYSTEM_INCLUDE_DIRECTORIES
    INSTALL_NAME_DIR
    INSTALL_RPATH
    INSTALL_RPATH_USE_LINK_PATH
    INTERPROCEDURAL_OPTIMIZATION
    INTERPROCEDURAL_OPTIMIZATION_<CONFIG>
    LABELS
    LIBRARY_OUTPUT_DIRECTORY
    LIBRARY_OUTPUT_DIRECTORY_<CONFIG>
    LIBRARY_OUTPUT_NAME
    LIBRARY_OUTPUT_NAME_<CONFIG>
    LINKER_LANGUAGE
    LINK_DEPENDS
    LINK_FLAGS
    LINK_FLAGS_<CONFIG>
    LINK_INTERFACE_LIBRARIES
    LINK_INTERFACE_LIBRARIES_<CONFIG>
    LINK_INTERFACE_MULTIPLICITY
    LINK_INTERFACE_MULTIPLICITY_<CONFIG>
    LINK_SEARCH_END_STATIC
    LINK_SEARCH_START_STATIC
    #LOCATION
    #LOCATION_<CONFIG>
    MACOSX_BUNDLE
    MACOSX_BUNDLE_INFO_PLIST
    MACOSX_FRAMEWORK_INFO_PLIST
    MAP_IMPORTED_CONFIG_<CONFIG>
    OSX_ARCHITECTURES
    OSX_ARCHITECTURES_<CONFIG>
    OUTPUT_NAME
    OUTPUT_NAME_<CONFIG>
    POST_INSTALL_SCRIPT
    PREFIX
    PRE_INSTALL_SCRIPT
    PRIVATE_HEADER
    PROJECT_LABEL
    PUBLIC_HEADER
    RESOURCE
    RULE_LAUNCH_COMPILE
    RULE_LAUNCH_CUSTOM
    RULE_LAUNCH_LINK
    RUNTIME_OUTPUT_DIRECTORY
    RUNTIME_OUTPUT_DIRECTORY_<CONFIG>
    RUNTIME_OUTPUT_NAME
    RUNTIME_OUTPUT_NAME_<CONFIG>
    SKIP_BUILD_RPATH
    SOURCES
    SOVERSION
    STATIC_LIBRARY_FLAGS
    STATIC_LIBRARY_FLAGS_<CONFIG>
    SUFFIX
    TYPE
    VERSION
    VS_DOTNET_REFERENCES
    VS_GLOBAL_WHATEVER
    VS_GLOBAL_KEYWORD
    VS_GLOBAL_PROJECT_TYPES
    VS_KEYWORD
    VS_SCC_AUXPATH
    VS_SCC_LOCALPATH
    VS_SCC_PROJECTNAME
    VS_SCC_PROVIDER
    VS_WINRT_EXTENSIONS
    VS_WINRT_REFERENCES
    WIN32_EXECUTABLE
    XCODE_ATTRIBUTE_WHATEVER
    IS_TEST_EXECUTABLE
  )
  map()
  kv(name ${target})
  kv(project_name ${PROJECT_NAME})


  foreach(property ${props})
    if("${property}" MATCHES "<CONFIG>")
        foreach(config ${CMAKE_CONFIGURATION_TYPES})
            string(TOUPPER "${config}" config)
            string(REPLACE "<CONFIG>" "${config}" configProp "${property}" )
            get_property(isset TARGET ${target} PROPERTY ${configProp} SET)
            if(isset)
                get_property(value TARGET ${target} PROPERTY ${configProp})
                key("${configProp}")
                val("${value}")    
            endif()
        endforeach()
    else()
        get_property(isset TARGET ${target} PROPERTY ${property} SET)
        if(isset)
            get_property(value TARGET ${target} PROPERTY ${property})
            key("${property}")
            val("${value}")    
        endif()    
    endif()





    
  endforeach()
  end()
  
  ans(res)
  return_ref(res)
endfunction()