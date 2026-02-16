#!/usr/bin/env python3
"""
GitHub Issues Creator Script

This script reads the issues.json file and creates GitHub issues
using the GitHub REST API.

Requirements:
- Python 3.x
- requests library (pip install requests)
- GitHub Personal Access Token with 'repo' scope

Usage:
    export GITHUB_TOKEN='your_personal_access_token'
    python create_issues.py

Or:
    python create_issues.py --token your_personal_access_token
"""

import json
import os
import sys
import argparse
import time
from typing import List, Dict

try:
    import requests
except ImportError:
    print("Error: 'requests' library is required.")
    print("Install it with: pip install requests")
    sys.exit(1)


class GitHubIssueCreator:
    def __init__(self, token: str, owner: str, repo: str):
        self.token = token
        self.owner = owner
        self.repo = repo
        self.api_url = f"https://api.github.com/repos/{owner}/{repo}/issues"
        self.headers = {
            "Authorization": f"token {token}",
            "Accept": "application/vnd.github.v3+json",
            "Content-Type": "application/json"
        }
    
    def create_issue(self, title: str, body: str, labels: List[str]) -> Dict:
        """Create a single GitHub issue."""
        data = {
            "title": title,
            "body": body,
            "labels": labels
        }
        
        response = requests.post(self.api_url, headers=self.headers, json=data)
        
        if response.status_code == 201:
            issue_data = response.json()
            return {
                "success": True,
                "number": issue_data["number"],
                "url": issue_data["html_url"]
            }
        else:
            return {
                "success": False,
                "status_code": response.status_code,
                "error": response.json() if response.content else "Unknown error"
            }
    
    def create_issues_from_file(self, filepath: str, delay: float = 1.0) -> None:
        """Create all issues from a JSON file."""
        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                issues = json.load(f)
        except FileNotFoundError:
            print(f"Error: File '{filepath}' not found.")
            sys.exit(1)
        except json.JSONDecodeError as e:
            print(f"Error: Invalid JSON in file '{filepath}': {e}")
            sys.exit(1)
        
        print(f"Found {len(issues)} issues to create.")
        print(f"Creating issues in {self.owner}/{self.repo}...")
        print("-" * 60)
        
        created_count = 0
        failed_count = 0
        
        for idx, issue in enumerate(issues, 1):
            title = issue.get("title", "")
            body = issue.get("body", "")
            labels = issue.get("labels", [])
            
            print(f"[{idx}/{len(issues)}] Creating: {title[:60]}...")
            
            result = self.create_issue(title, body, labels)
            
            if result["success"]:
                print(f"  ✓ Created issue #{result['number']}: {result['url']}")
                created_count += 1
            else:
                print(f"  ✗ Failed: Status {result['status_code']}")
                print(f"    Error: {result['error']}")
                failed_count += 1
            
            # Add delay to avoid rate limiting
            if idx < len(issues):
                time.sleep(delay)
        
        print("-" * 60)
        print(f"Summary:")
        print(f"  Created: {created_count}")
        print(f"  Failed:  {failed_count}")
        print(f"  Total:   {len(issues)}")


def main():
    parser = argparse.ArgumentParser(
        description="Create GitHub issues from issues.json file"
    )
    parser.add_argument(
        "--token",
        help="GitHub Personal Access Token (or set GITHUB_TOKEN env var)",
        default=os.environ.get("GITHUB_TOKEN")
    )
    parser.add_argument(
        "--owner",
        help="Repository owner (default: andrei-korbut)",
        default="andrei-korbut"
    )
    parser.add_argument(
        "--repo",
        help="Repository name (default: home-projects)",
        default="home-projects"
    )
    parser.add_argument(
        "--file",
        help="Path to issues.json file (default: ./issues.json)",
        default="./issues.json"
    )
    parser.add_argument(
        "--delay",
        help="Delay between API calls in seconds (default: 1.0)",
        type=float,
        default=1.0
    )
    parser.add_argument(
        "--dry-run",
        help="Show what would be created without actually creating issues",
        action="store_true"
    )
    
    args = parser.parse_args()
    
    if not args.token:
        print("Error: GitHub token is required.")
        print("Provide it via --token argument or GITHUB_TOKEN environment variable.")
        print("\nTo create a token:")
        print("1. Go to https://github.com/settings/tokens")
        print("2. Click 'Generate new token' -> 'Generate new token (classic)'")
        print("3. Give it a name and select 'repo' scope")
        print("4. Click 'Generate token' and copy the token")
        sys.exit(1)
    
    if args.dry_run:
        print("DRY RUN MODE - No issues will be created")
        print("-" * 60)
        try:
            with open(args.file, 'r', encoding='utf-8') as f:
                issues = json.load(f)
            
            print(f"Would create {len(issues)} issues in {args.owner}/{args.repo}:")
            print()
            for idx, issue in enumerate(issues, 1):
                print(f"{idx}. {issue['title']}")
                print(f"   Labels: {', '.join(issue['labels'])}")
                print()
        except Exception as e:
            print(f"Error reading file: {e}")
            sys.exit(1)
    else:
        creator = GitHubIssueCreator(args.token, args.owner, args.repo)
        creator.create_issues_from_file(args.file, args.delay)


if __name__ == "__main__":
    main()
