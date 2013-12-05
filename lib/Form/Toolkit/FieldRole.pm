package Form::Toolkit::FieldRole;
{
  $Form::Toolkit::FieldRole::VERSION = '0.001';
}
use Moose::Role;
requires qw/validate add_error/;

=head1 NAME

Form::Toolkit::FieldRole - A Base role for field roles.

=cut

1;
