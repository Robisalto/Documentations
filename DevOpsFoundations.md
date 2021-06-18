---
title: DevOps Foundations
author: Ernest Mueller and James Wickett
linkcolor: lightblue
pdf-engine: xelatex
header-includes:
 - \usepackage[margin=.5in]{geometry}
classoption: "12pt"
---
<link rel="icon" href="favicon.png" type="image/png" />

# Welcome
<p style="align-content: center;">
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\Welcome.mp4" type="video/mp4">
</video>
</p>

# I. DevOps Basics
## I-I. What is DevOps?
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\I-I. What is DevOps.mp4" type="video/mp4">
</video>

## I-II. DevOps core values: CAMS
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\I-II. DevOps core values CAMS.mp4" type="video/mp4">
</video>

- **C**: Culture
- **A**: Automation
- **M**: Measurement
- **S**: Sharing (feedback loop)

## I-III. DevOps principles: The three ways
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\I-III. DevOps principles The three ways.mp4" type="video/mp4">
</video>

### I-III-I. **Systems Thinking:** 
Overall results are prioritize, you must understand the whole system to improve it.

### I-III-II. **Amplifing Feedback Loops:** 
Short effective feedback loops are the key. 

### I-III-IIII. **Culture of continuous experimentation and learning** 
Repetition of pratice by tryouts and experience.

## I-IV. Your DevOps playbook
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\I-IV. Your DevOps playbook.mp4" type="video/mp4">
</video>
People over Process over Tools.

## I-VI. 10 practices for DevOps success (10 through 6)
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\I-VI. 10 practices for DevOps success (10 through 6).mp4" type="video/mp4">
</video>
>10. Incident Command System
>9. Developper on Call
>8. Public Status Pages
>7. Blameless Postmortems
>6. Embedded Teams

## I-VII. 10 practices for DevOps success (5 through 1)
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\I-VII. 10 practices for DevOps success (5 through 1).mp4" type="video/mp4">
</video>
>5. The CLoud
>4. The Andon Cord
>3. Dependency Injection
>2. Blue/Green Deployment
>1. Chaos Monkey

## I-V. DevOps tools: The cart or the horse?
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\I-V. DevOps tools The cart or the horse.mp4" type="video/mp4">
</video>

## I-VI. Quizz

<span class="question">1. How would you summarize the key DevOps tenet? </span>
<span class="answer">DevOps is a partnership of all the team members involved in software development and operations. DevOps is a collaboration between the development and operations team members.</span>


<span class="question"> 2. DevOps unites team members from both the _____ and _____ to participate in the IT service lifecycle from design to ongoing support. </span>
<span class=answer>“code side”; “system side”</span>


### 3. Let’s say your company’s server went down for a few days due to a hurricane. How would having a status page affect your company’s reputation throughout the outage?
Communicating on the status page throughout the outage will notify the users of the issues and deadline for resolution. It can improve the trust and satisfaction of the customers.

### 4. When considering the People over Process over Tools methodology, why is it important to focus on People first?
You need a responsible individual with the appropriate skill set who knows the planning and implementation of the project and tools otherwise there will be wastage and inferior product and solution delivery.

### 5. What are the five levels of DevOps practice? 
values, principles, methods, practices, and tools

### 6. Tools are launched daily for diverse purposes. Which qualities should you look for in a tool before combining it into a toolchain?
All of these :)

### 7. Suppose you want to test the resilience of your company’s e-commerce website in preparation for the holiday shopping season. How would having a Chaos Monkey test the abilities of your servers?
The Chaos Monkey will interrupt normal operations for your server, forcing your engineers to find methods to make the server robust and tolerant to instance failures.

### 8. How can you implement experimentation and learning in your work environment?
Rotate your employees to attend conferences and share vital information with their colleagues.

### 9. What are the four values in the CAMS model?
CAMS: Culture, Automation, Measurement, and Sharing

# II. DevOps: A Culture Problem
## II-I. The IT crowd and the coming storm
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\II-I. The IT crowd and the coming storm.mp4" type="video/mp4">
</video>

## II-II. Use your words
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\II-II. Use your words.mp4" type="video/mp4">
</video>

## II-III. Do unto others
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\II-III. Do unto others.mp4" type="video/mp4">
</video>

## II-IV. Throwing things over walls
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\II-IV. Throwing things over walls.mp4" type="video/mp4">
</video>

## II-V. Kaizen Continuous improvement
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\II-V. Kaizen Continuous improvement.mp4" type="video/mp4">
</video>
- **Gemba**: Go to the place of the process.
- The **5 Whys**

## II-VI. QUIZZ

> 1. Let’s say you need to tackle an important issue about a system failure. What important point should be discussed in the post mortem meeting?

Explain that no one is to be assigned blame for the system failure in the meeting.

*It is important that your team members should not be assigned blame since the objective is to find a solution to the underlying cause*.

> 2. Companies need to tear down the _____ since it causes disunity and disharmony between the development and operations departments, instead of allowing them to collaborate collectively and align goals or objectives.

Wall of Confusion

*Wall of confusion is a wall that blocks cooperation and a open line of communication between the operations and development teams.*

> 3. DevOps supports the elimination of _____ because it can hamper collaboration, operations and morale within the company.

Silos

> 4. Suppose your Dev team has frequent issues with an Ops Teams in your company. Blame is often tossed around between both groups. How would you solve this issue?

Embed Ops engineers in your development teams, assign both teams to be in one chat room, and allow them to read each other's source code.

> 5. Let’s say you want to employ the Kaizen cultural practice in your company. What are the four main factors in the Kaizen cycle?

plan, do, check, and act

# III. The Building Blocks of DevOps
## III-I. DevOps building block: Agile
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\III-I. DevOps building block Agile.mp4" type="video/mp4">
</video>

## III-II. DevOps building block: Lean
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\III-I. DevOps building block Lean.mp4" type="video/mp4">
</video>

## III-III. ITIL, ITSM, and the SDLC
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\III-II. ITIL, ITSM, and the SDLC.mp4" type="video/mp4">
</video>

## III-IV. QUIZZ
> 1. Let’s say your colleague wants to know more about the central tenet of Lean. How would you explain it to them?

The objective of lean is to ensure that value stream reaches the customer through products and services while eliminating waste.

> 2. DevOps is an extension of _____ infrastructure in which its process is _____.

Agile; iterative

DevOps has roots in Agile and the process are iterative which generates quick product or solution delivery.

> 3. Information Technology Infrastructure Library or ITIL provides a comprehensive process-model based approach of designing, managing, and controlling IT processes.

TRUE

# IV. Infrastrucutre Automation
## IV-I. Infrastructure as code
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\IV-I. Infrastructure as code.mp4" type="video/mp4">
</video>

## IV-II. Golden image to foil ball
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\IV-II. Golden image to foil ball.mp4" type="video/mp4">
</video>

**Provisioning** is the process of making a server ready for operation, including hardware, OS, system services, network connectivity.

**Deployment** is the process of automatically deploying and upgrading applications on a server.

**Orchestration** is the act of performing coordinated operations across multiple systems.

**Configuration management** is an overarching term dealing with change control ofsystem configuration after initial provision, but is often also applied to maintaining and upgrading application and application dependencies. 

**Imperative** also known as “procedural,” this is an approach where commands desired to produce a state are defined and executed. 

**Declarative** also known as “functional,” this is an approach where you define a desired state and the tool converges the existing system on the model.

**Idempotent** the ability to execute the CM procedure repeatedly and end up in the same state each time. 

**Self service** is the ability for an end user to kick off one of these processes without having to go through other people.

## IV-III. Immutable deployment
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\IV-III. Immutable deployment.mp4" type="video/mp4">
</video>

## IV-IV. Your infrastructure toolchain
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\IV-IV. Your infrastructure toolchain.mp4" type="video/mp4">
</video>

## IV-V. QUIZZ
> 1. Which of the following explains the concept of blue-green deployment?

There are two identical production environments in which one is live (Blue) and the other is idle (Green). When new software is fully tested and deployed to Green, the router switches traffic from Blue to Green

> 2. Suppose you and your project manager are interested in the infrastructure as code approach. What is the chief issue that your team may face when utilizing the infrastructure as code approach?

The mindset and habits of your team members.

> 3. Certain companies utilize immutable deployment, in which changes to the system are _____ as opposed to _____.

replaced; updated

> 4. Which of the following explains the concept of containers?

Containers are stand-alone software packages that contain runtime components to function independently.

# V. Continuous Delivery
## V-I. Small + fast = better
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\V-I. Small + fast = better.mp4" type="video/mp4">
</video>

## V-II. Continuous integration practices
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\V-II. Continuous integration practices.mp4" type="video/mp4">
</video>

## V-III. The continuous delivery pipeline 
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\V-III. The continuous delivery pipeline.mp4" type="video/mp4">
</video>

## V-IV. The role Of QA
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\V-IV. The role Of QA.mp4" type="video/mp4">
</video>

## V-V. Your CI toolchain
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\V-V. Your CI toolchain.mp4" type="video/mp4">
</video>

## V-VI. QUIZZ
> 1. Artifacts should be _____.

built once and deployed as needed
 
> 2. What is a build log?

It is a record of all the tests that were run along with their results.
 
> 3. Jenkins is an example of _____.

a continuous integration tool
 
> 4. Suppose some of your tests are slow. Which procedures should you select to handle a slow test?

- Time-schedule monitoring
- Use non-blocking tests
- Use Monitoring
 
> 5. _____ describe when software is deployed quickly into production since the team members make sure the application goes through complete automated testing.

Continuous deployments

# VI. Reliability Engineering
## VI-I. Engineering doesn't end with deployment
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\VI-I. Engineering doesn't end with deployment.mp4" type="video/mp4">
</video>

## VI-II. Design for operation (Theory)
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\VI-II. Design for operation (Theory).mp4" type="video/mp4">
</video>

- [Martin Fowler's Architecture Descriptions](http://martinfowler.com/bliki/)

## VI-III. Design for operation (Practice)
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\VI-III. Design for operation (Practice).mp4" type="video/mp4">
</video>

## VI-IV. Operate for design: Metrics and monitoring
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\VI-IV. Operate for design Metrics and monitoring.mp4" type="video/mp4">
</video>

## VI-V. Operate for design: Logging
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\VI-V. Operate for design Logging.mp4" type="video/mp4">
</video>

## VI-VI. Your SRE toolchain
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\VI-VI. Your SRE toolchain.mp4" type="video/mp4">
</video>

## V-VI. QUIZZ
> 1. Which pattern detects a threshold of failures and prevents further failure by stopping an application from repeatedly executing that action to protect the system?

The Circuit Breaker Pattern

> 2. _____ refers to the average time your service recovers and restores services from disruptions, such as an outage.

**MTTR**: Mean Time To Recovery
 
> 3. Developers can find bottlenecks during the development process by using a _____ instead of employing the “black box” methodology.

Code Profiler
 
> 4. Suppose your company is going to purchase a security monitoring tool. How should you select a security monitoring tool?

It should match and integrate well with your system and should be functional when you launch new applications.

*The security monitoring tool should suit your system and is compatible with new deployments.*
 
> 5. _____ places all log records in a secured storage area or location.

Centralized logging

> 6. Let’s say your colleagues are debating whether to employ synthetic or real user monitoring. How is real user monitoring different than synthetic checks?

Real user monitoring records all the actual end user’s engagement with the web application. Synthetic checks simulate how a user might interact with the application.

# VII. Additionnal DevOps Resources
## VII-I. Unicorns, horses, and donkeys, oh my
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\VII-I. Unicorns, horses, and donkeys, oh my.mp4" type="video/mp4">
</video>
- [DevOps Days](https://devopsdays.org/)
- [Conferences](https://www.bmc.com/blogs/devops-conferences/)

## VII-II. The 10 best DevOps books you need to read
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\VII-II. The 10 best DevOps books you need to read.mp4" type="video/mp4">
</video>
- The Visible Ops Handbook: Implementing ITIL in 4 Practical and Auditable Steps, by Gene Kim, Kevin Behr, and George Spaffordhttps://www.amazon.com/Visible-Ops-Handbook-Implementing-Practical/dp/0975568612
- Continuous Delivery, by Jez Humble and David Farley [https://www.amazon.com/Continuous-Delivery-Deployment-Automation-Addison-Wesley/dp/0321601912](https://www.amazon.com/Continuous-Delivery-Deployment-Automation-Addison-Wesley/dp/0321601912)
- Release It!, by Michael Nygard [https://pragprog.com/book/mnee/release-it](https://pragprog.com/book/mnee/release-it)
- Effective DevOps, by Jennifer Davis and Katherine Daniels [http://shop.oreilly.com/product/0636920039846.do](http://shop.oreilly.com/product/0636920039846.do)
- Lean Software Development: An Agile Toolkit, by Mary and Tom Poppendieck [https://www.amazon.com/Lean-Software-Development-Agile-Toolkit/dp/0321150783](https://www.amazon.com/Lean-Software-Development-Agile-Toolkit/dp/0321150783)
- Web Operations, by John Allspaw and Jesse Robbins [https://www.amazon.com/Web-Operations-Keeping-Data-Time/dp/1449377440](https://www.amazon.com/Web-Operations-Keeping-Data-Time/dp/1449377440)
- The Practice of Cloud System Administration, by Christine Hogan, Strata R. Chalup, and Thomas A. Limoncelli [http://the-cloud-book.com/](http://the-cloud-book.com/)
- The DevOps Handbook, by Gene Kim, Jez Humble, Patrick Debois, and John Willis [http://itrevolution.com/devops-handbook](http://itrevolution.com/devops-handbook)
- Leading the Transformation, by Gary Gruver and Tommy Mouser [http://itrevolution.com/books/leading-the-transformation/](http://itrevolution.com/books/leading-the-transformation/)
The Phoenix Project, by Gene Kim, Kevin Behr, George Spafford [https://en.wikipedia.org/wiki/The_Phoenix_Project](https://en.wikipedia.org/wiki/The_Phoenix_Project)

## VII-III. Navigating The Series of Tubes
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\VII-III. Navigating The Series of Tubes.mp4" type="video/mp4">
</video>
- DevOps Weekly, by Gareth Rushgrove [http://www.devopsweekly.com/](http://www.devopsweekly.com/) @garethr
- DevOps.com, Chief Editor: Alan Shimel [http://devops.com/](http://devops.com/) @devopsdotcom@ashimmy
- DZone [https://dzone.com/devops-tutorials-tools-news](http://devops.com/)
- InfoQ [https://www.infoq.com/devops/](http://devops.com/)

## VII-IV. QUIZZ
> 1. DevOpsDays, DevOps Enterprise Summit, and Velocity. are examples of _____.

Conferences

> 2. Which leading social media network should an individual engage in to keep abreast of the DevOps news and development?

Twitter
 
> 3. Let’s say your colleague is unable to attend a DevOps conference. How would you recommend she learn more about DevOps concepts?

Introduce her to books and articles devoted to DevOps

# VIII. The Future of DevOps
## VIII-I.Cloud to containers to serverless solutions
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\VIII-I.Cloud to containers to serverless solutions.mp4" type="video/mp4">
</video>

## VIII-II. The rugged frontier of DevOps: Security
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\VIII-II. The rugged frontier of DevOps Security.mp4" type="video/mp4">
</video>

Usually: 100:10:1
- 100 Developers
- 10 Ops
- 1 Security

[https://digital.ai/technology/gauntlt](https://digital.ai/technology/gauntlt)

[The Rugged Manifesto](https://ruggedsoftware.org/)

## VIII-III. QUIZZ
> 1. What computing approach creates systems in the cloud instead of depending on servers?

Serverless architecture

> 2. Suppose your company is weighing options on implementing private or public cloud. How would you explain the difference between public or private cloud?

Private cloud is internally created, built, and operated by your own company. Public cloud is created by an individual or organization, such as Amazon Web Services, and they allow users from around the world to use their services.
 
> 3. Which manifesto, created in 2010 by security professionals, endorses the call for secure coding or programming?

[The Rugged Manifesto (PDF)](https://github.com/planetlevel/rugged-software/raw/master/documents/Rugged-Handbook-v7.pdf)
 
# Conclusion
## Next steps: Am I a DevOp now?
<video width="600" height="337" controls>
  <source src="DevOpsFoundations\Conclusion-Next steps Am I a DevOp now.mp4" type="video/mp4">
</video>

## Resources
[DevOpsFoundations\DevOpsFundamentalsCourseHandout.pdf](DevOpsFoundations\DevOpsFundamentalsCourseHandout.pdf)

## CERTIFICATION
<p style="text-align: center; text-decoration-color: red">
  [CertificateOfCompletion_DevOps Foundations.pdf](DevOpsFoundations\CertificateOfCompletion_DevOps Foundations.pdf)
</p>

---

<p style="text-align: center"> [DevOps Foundations - Version PDF](DevOpsFoundations.pdf) </p>

---
