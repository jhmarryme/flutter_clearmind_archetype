ifeq ($(OS),Windows_NT)
    BUILD_CMD=.\build_and_run_app.bat
    METRICS_CMD=.\tools\dart_code_metrics.bat
    COMMIT_CHECK_CMD=.\tools\check_commit_message.bat
else
    BUILD_CMD=./build_and_run_app.sh
    METRICS_CMD=./tools/dart_code_metrics.sh
    COMMIT_CHECK_CMD=./tools/check_commit_message.sh
endif

l10n:
	@melos run l10n

test:
	@melos run test

test_app:
	@melos run test_app

test_domain:
	@melos run test_domain

test_data:
	@melos run test_data

test_shared:
	@melos run test_shared

clean:
	@melos clean

pub_get:
	@melos bootstrap

format:
	@melos run format

analyze:
	@melos run analyze

analyze_app:
	@melos run analyze_app

analyze_data:
	@melos run analyze_data

analyze_domain:
	@melos run analyze_domain

analyze_shared:
	@melos run analyze_shared

lint:
	@melos run lint

metrics:
	@melos run metrics

metrics_app:
	@melos run metrics_app

metrics_data:
	@melos run metrics_data

metrics_domain:
	@melos run metrics_domain

metrics_shared:
	@melos run metrics_shared

format_lint:
	@melos run format_lint

test_coverage:
	@melos run test_coverage

check_unused_files:
	@melos run check_unused_files

sync:
	@melos bootstrap
	@melos run l10n
	@melos run force_build_all

build_all:
	@melos run build_all
build_app:
	@melos run build_app
build_domain:
	@melos run build_domain
build_data:
	@melos run build_data
build_shared:
	@melos run build_shared
force_build_all:
	@melos run force_build_all
force_build_app:
	@melos run force_build_app
force_build_domain:
	@melos run force_build_domain
force_build_data:
	@melos run force_build_data
force_build_shared:
	@melos run force_build_shared
watch_all:
	@melos run watch_all
watch_app:
	@melos run watch_app
watch_domain:
	@melos run watch_domain
watch_data:
	@melos run watch_data
watch_shared:
	@melos run watch_shared
force_watch_all:
	@melos run force_watch_all
force_watch_app:
	@melos run force_watch_app
force_watch_domain:
	@melos run force_watch_domain
force_watch_data:
	@melos run force_watch_data
force_watch_shared:
	@melos run force_watch_shared

pub_get_data:
	@melos run pub_get_data
pub_get_domain:
	@melos run pub_get_domain
pub_get_app:
	@melos run pub_get_app
pub_get_shared:
	@melos run pub_get_shared

pub_upgrade:
	melos pub_upgrade
	
pub_sync:
	cd tools && ./sync_all_pub_versions.sh
	melos bootstrap

dart_fix:
	dart fix --apply
