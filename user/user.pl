#!/usr/bin/perl -w

use Metadata::Base;
use Metadata::HTTP;
use Metadata::IAFA;
use Metadata::SOIF;
use Metadata::DB;
use Metadata::DB::Base;
use Smart::Comments;
use Clear;
use Clear::Programming;
use Clear::Recommend;
use Clear::Util;
use Clear::Voy::Index;
use Bot::BB2;
use Bot::BB2::CommandParser;
use Bot::BB2::ConfigParser;
use Bot::BB2::DaemonUtils;
use Bot::BB2::PluginConfigParser;
use Bot::BB2::TiedPluginHandle;
use CSO;
use CSO::Source::AptCache;
use CSO::Source::AptGetDotOrg;
use CSO::Source::CPAN;
use CSO::Source::DMOZ;
use CSO::Source::Freshmeat;
use CSO::Source::LSM;
use CSO::Source::MyFRDCSA;
use CSO::Source::SAL;
use CSO::Source::Sourceforge;
use CSO::Source::Spider;
use CSO::Source::Template;
use XML::SAX;
use XML::SAX::DocumentLocator;
use XML::SAX::Exception;
use XML::SAX::ParserFactory;
use XML::SAX::PurePerl;
use XML::SAX::PurePerl::DebugHandler;
use XML::SAX::PurePerl::Exception;
use XML::SAX::PurePerl::Productions;
use XML::SAX::PurePerl::Reader;
use XML::SAX::PurePerl::Reader::Stream;
use XML::SAX::PurePerl::Reader::String;
use XML::SAX::PurePerl::Reader::URI;
use Alvis::AinoDump;
use Alvis::Buffer;
use Alvis::Canonical;
use Alvis::Convert;
use Alvis::Document;
use Alvis::Document::Encoding;
use Alvis::Document::Links;
use Alvis::Document::Meta;
use Alvis::Document::Type;
use Alvis::HTML;
use Alvis::Utils;
use Alvis::Wikipedia::CatGraph;
use Alvis::Wikipedia::Templates;
use Alvis::Wikipedia::Variables;
use Alvis::Wikipedia::WikitextParser;
use Alvis::Wikipedia::XMLDump;
use Alvis::NLPPlatform;
use Alvis::NLPPlatform::Annotation;
use Alvis::NLPPlatform::Canonical;
# use Alvis::NLPPlatform::Convert;
use Alvis::NLPPlatform::Document;
use Alvis::NLPPlatform::MyReceiver;
use Alvis::NLPPlatform::NLPWrappers;
use Alvis::NLPPlatform::UserNLPWrappers;
use Alvis::NLPPlatform::XMLEntities;
use Gnome2::Install::Files;
use Gnome2;
use Gnome2::GConf::Install::Files;
use Image::OCR::Tesseract;
use LEOCHARRE::Class2;
use LEOCHARRE::Database;
use LEOCHARRE::Database::Base;
use LEOCHARRE::DBI;
use Test;
use Net::Google::Calendar;
use Net::Google::Calendar::Base;
use Net::Google::Calendar::Calendar;
use Net::Google::Calendar::Entry;
use Net::Google::Calendar::Person;
use Net::Google::Calendar::WebContent;
# use attrs;
use B;
use B::Asmdata;
use B::Assembler;
use B::Bblock;
use B::Bytecode;
use B::CC;
use B::Concise;
use B::Debug;
use B::Deparse;
use B::Lint;
use B::Showlex;
use B::Stackobj;
use B::Stash;
use B::Terse;
use B::Xref;
# use ByteLoader;
use Config;
use Cwd;

use System::LinkParser;

use Rival::Symbol::Table;
sub Test123 {
  print "Hi\n";
}

my $a = Rival::Symbol::Table::Package->new
  (
   Name => "main::",
   Package => undef,
  );
