import os

if "APPVEYOR_REPO_BRANCH" in os.environ:
	print os.environ["APPVEYOR_REPO_BRANCH"]

for key, value in os.environ.items():
	print key, ":", value
