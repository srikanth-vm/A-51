if git.added_files.include?('Dangerfile')
    failure('Modified file.')
    warn('Please do not modify this file', file: 'Dangerfile', line: 1)
end

if git.modified_files.include?('Dangerfile')
    warn('Modified file.')
    warn('Please do not modify this file', file: 'Dangerfile', line: 1)
end

message(bitbucket_server.pr_title)
json = bitbucket_server.pr_json
#puts "Hello: #{json}"

# Commit Template

commit_message_types = ["feature", "bugfix", "chore", "lint"]
git.commits.each do | commit |

    # All Commits should start with feat/chore/bugfix/lint.
    if commit.message.start_with?(*commit_message_types) == false 
        fail "Commit template not followed. #{commit.message}"
    end

    # Should be more than 50 characters.
    if commit.message.length < 50
        fail "Please include a meaningful commit message. #{commit.message}"
    end

end