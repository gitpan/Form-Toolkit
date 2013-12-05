
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Data centric form(s) toolkit",
  "AUTHOR" => "Jerome Eteve <jerome.eteve\@gmail.com>",
  "BUILD_REQUIRES" => {
    "DBD::SQLite" => 0,
    "DBI" => 0,
    "DBIx::Class::Schema::Loader" => 0,
    "Data::Dumper" => 0,
    "Test::Exception" => 0,
    "Test::More" => 0,
    "base" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Form-Toolkit",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Form::Toolkit",
  "PREREQ_PM" => {
    "Class::MOP" => 0,
    "DateTime" => 0,
    "DateTime::Format::ISO8601" => 0,
    "Mail::RFC822::Address" => 0,
    "Module::Pluggable::Object" => 0,
    "Moose" => 0,
    "Moose::Role" => 0,
    "Moose::Util" => 0,
    "MooseX::Clone" => 0,
    "Scalar::Util" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



