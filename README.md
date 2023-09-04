# Lunch and Learn Management System (LLMS)

Welcome to my Lunch and Learn Management System (LLMS) project! I'm excited to embark on this journey as a trainee, and today marks the beginning of this exciting development project. LLMS is aimed at streamlining the management of lunch and learn sessions within our organization, providing a platform for organizing, attending, and engaging in these valuable learning sessions.

## Project Overview

LLMS is a web-based application designed to simplify the management of lunch and learn sessions. It empowers employees to coordinate, participate in, and interact during these educational gatherings.

## Getting Started

Here are the steps to set up and run the LLMS application on your local development environment. Please note that this is a Ruby on Rails project, and we'll be using PostgreSQL as our database.

### Prerequisites

Before we get started, make sure you have the following software installed on your development machine:

- Ruby (version 3.2.2)
- Ruby on Rails (version 7.0.7.2)
- PostgreSQL (version 14.9)

### Installation

1. Clone this repository to your local machine:

   ```shell
   git clone git@git.bajratechnologies.com:Ranjan.sc/lunch-and-learn-management-system.git
   ```

2. Change into the project directory:

   ```shell
   cd lunch-and-learn-management-system
   ```

3. Install the required gems:

   ```shell
   bundle install
   ```

4. Create the database and run migrations:

   ```shell
   rails db:create
   rails db:migrate
   ```

5. Start the Rails server:

   ```shell
   rails server
   ```

6. Visit `http://localhost:3000` in your web browser to access the LLMS application.

## Database

LLMS uses PostgreSQL as its database system. You can find the database configuration in `config/database.yml`.

To create the database, run:

```shell
rails db:create
```

To initialize the database with tables, run:

```shell
rails db:migrate
```

## Testing

To run the test suite, execute:

```shell
bundle exec rspec
```

## Contributing

I'm open to contributions that can help improve the Lunch and Learn Management System. Please feel free to submit issues and pull requests to make this project even better.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

I'd like to express my gratitude to my mentors and colleagues for their valuable guidance and support during this project.

Thank you for joining me on this LLMS development journey. Let's build something great together! Happy coding!