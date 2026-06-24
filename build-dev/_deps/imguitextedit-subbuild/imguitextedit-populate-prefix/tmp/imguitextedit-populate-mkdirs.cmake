# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "C:/tmp/meccha-camouflage/build-dev/_deps/imguitextedit-src")
  file(MAKE_DIRECTORY "C:/tmp/meccha-camouflage/build-dev/_deps/imguitextedit-src")
endif()
file(MAKE_DIRECTORY
  "C:/tmp/meccha-camouflage/build-dev/_deps/imguitextedit-build"
  "C:/tmp/meccha-camouflage/build-dev/_deps/imguitextedit-subbuild/imguitextedit-populate-prefix"
  "C:/tmp/meccha-camouflage/build-dev/_deps/imguitextedit-subbuild/imguitextedit-populate-prefix/tmp"
  "C:/tmp/meccha-camouflage/build-dev/_deps/imguitextedit-subbuild/imguitextedit-populate-prefix/src/imguitextedit-populate-stamp"
  "C:/tmp/meccha-camouflage/build-dev/_deps/imguitextedit-subbuild/imguitextedit-populate-prefix/src"
  "C:/tmp/meccha-camouflage/build-dev/_deps/imguitextedit-subbuild/imguitextedit-populate-prefix/src/imguitextedit-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/tmp/meccha-camouflage/build-dev/_deps/imguitextedit-subbuild/imguitextedit-populate-prefix/src/imguitextedit-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/tmp/meccha-camouflage/build-dev/_deps/imguitextedit-subbuild/imguitextedit-populate-prefix/src/imguitextedit-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
