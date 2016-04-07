# base

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)

## Overview

Basic puppet module to setup a base system for TIER applications

## Module Description

This module installs the appropriate versions of apache, tomcat, and a JRE,
plus a script to reconfigure TIER servers.

## Usage

  include base

## Limitations

Only tested on CentOS 7.

