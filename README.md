# LittleChef - Kitchen

## Overview

LittleChef is written in Python and uses Fabric as the underlying mechanism of getting Chef Solo installed on a remote node,
then sending cookbooks and roles to that node for further processing via Chef Solo. It brings together a nice mix of push-based
and pull-based server automation. It also adds features to Chef Solo that are currently only available for Chef Server users:
data bag search, and node search.

The present repository is the Kitchen for LittleChef, which contains all the nodes, roles, cookbooks, data_bags and plugins
required to completely define a server or Amazon Instance.

## Repository Directory Structure and its purpose

* `auth.cfg`: Authentication information needed to be able to connect to the nodes
* `nodes/`: After recipes are run on [Nodes][], their configuration is stored here in
JSON format. You can manually edit them or even add new ones. The name of a node
should be its FQDN. It is a good practice to not create new ones directly here but rather
let chef populate it with each node created.
* `cookbooks/`: This is like a bucket that contains all cookbooks which are generic and
or published by third-party like Opscode,etc
* `site-cookbooks/`: This is the place where our cookbooks and recipes will be placed, unless
we have to use the generic one from cookbooks or mildly modify the ones there.
* `roles/`: Where Chef [Roles][] are defined in JSON
* `data_bags/`: Chef [Data Bags][]. JSON databag items. Search is supported
* `plugins/`: Your plugin tasks

## Git WorkFlow

The golden rule of Git will be strictly followed:

- Commit and push as frequently as possible.
- To reduce conflicts, always pull the lastest code before any changes are to be made.

During the development cycle, we will adhere to the git workflow as demonstrated below

### The Main Branches

The Git Repository will have two main branches with infinite lifetime:
* master: The master branch will always contain the production-ready codes. No direct commits are permitted to the master branch and
we tend to be very strict about this. All changes to master branch will be through the merge from develop or release or hotfix branch.
* develop: The develop branch will always reflects a state with the latest delivered development changes for the next release.
When the source code in the develop branch reaches a stable point and is ready to be released, all of the changes should be merged
back into master and then tagged with a release number. Therefore, each time when changes are merged back into master, this is a new
production release by definition. Here too no direct commits are permitted and we end to be very strict about this. All changes to
develop branch will be through the merge from developer or release or hotfix branch

### Developer Branches

The Git Repository will also have developer branches. Each developer will maintain a separate branch with their name as the branch name.
These branches will be fork/clone of the develop branch and can only merge back to develop branch.

### Other Supporting Branches [if required]

The Git Repository will (in subject to requirement) also entertain supporting branches to aid parallel development between team members,
ease tracking of features, prepare for production releases and to assist in quickly fixing live production problems. Unlike the main and
developer branches, these branches always have a limited life time, since they will be removed eventually. Each of these branches have a
specific purpose and are bound to strict rules as to which branches may be their originating branch and which branches must be their merge
targets.

The different types of branches we may use are:

>##### Feature branches
> Feature branches as name suggests will be used to develop new features. The essence of a feature branch is that it exists as long as the
> feature is in development, but will eventually be merged back into develop or discarded. The feature branch can branch off and merge back
> only with the develop branch. The naming convention will be usually the most appropriate name for the feature except master, develop,
> developer name, release-*, or hotfix-*
>
>##### Release branches
> Release branches support preparation of a new production release. They allow for the last minute changes, minor bug fixes and other minor
> work for the production release. By doing all of this work on a release branch, the develop branch is cleared to receive features for the
> next big release. The key moment to branch off a new release branch from develop is when develop (almost) reflects the desired state of the
> new release. The release branch can branch off the develop branch and merge back into develop and production branch.  The naming convention
> will be usually release-*, where * represents the same tag that will be used when tagging the new production master branch.
>
>##### Hotfix branches
> Hotfix branches that are called when some emergency fix, roll-back or modification needs to be done on the present live master branch. They
> arise from the necessity to act immediately upon an undesired state of a live production version. When a critical bug in a production version
> must be resolved immediately, a hotfix branch may be branched off from the corresponding tag on the master branch that marks the production version.
> The hotfix branch can branch off from master only and merge back into develop and master. The naming convention will be usually hotfix-*, where *
> represents the corresponding tag on the master branch from which it was branched out.
