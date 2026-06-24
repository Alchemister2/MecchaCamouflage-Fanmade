# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "C:/tmp/meccha-camouflage/build/_deps/raw_pdb-src")
  file(MAKE_DIRECTORY "C:/tmp/meccha-camouflage/build/_deps/raw_pdb-src")
endif()
file(MAKE_DIRECTORY
  "C:/tmp/meccha-camouflage/build/_deps/raw_pdb-build"
  "C:/tmp/meccha-camouflage/build/_deps/raw_pdb-subbuild/raw_pdb-populate-prefix"
  "C:/tmp/meccha-camouflage/build/_deps/raw_pdb-subbuild/raw_pdb-populate-prefix/tmp"
  "C:/tmp/meccha-camouflage/build/_deps/raw_pdb-subbuild/raw_pdb-populate-prefix/src/raw_pdb-populate-stamp"
  "C:/tmp/meccha-camouflage/build/_deps/raw_pdb-subbuild/raw_pdb-populate-prefix/src"
  "C:/tmp/meccha-camouflage/build/_deps/raw_pdb-subbuild/raw_pdb-populate-prefix/src/raw_pdb-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/tmp/meccha-camouflage/build/_deps/raw_pdb-subbuild/raw_pdb-populate-prefix/src/raw_pdb-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/tmp/meccha-camouflage/build/_deps/raw_pdb-subbuild/raw_pdb-populate-prefix/src/raw_pdb-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
