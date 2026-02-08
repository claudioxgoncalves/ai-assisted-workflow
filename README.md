# AI-Assisted RPG Development Workflow

**A methodology for using LLMs as guided RPG development assistants — with guardrails, not guesswork.**

---

## The Problem

AI can write code. But "write me an RPG program" produces garbage — the model doesn't know your naming conventions, your subroutine structure, your data access patterns, your error handling philosophy. It hallucinates syntax. It invents fields. It mixes paradigms.

So I flipped the approach. Instead of asking AI to *write* RPG, I built a system that teaches AI to *think* in RPG — my RPG — by giving it the same reference material a human developer would use.

**The developer designs the system. AI executes within it.**

---

## The Framework

The AI doesn't improvise. It operates within a documentation ecosystem I designed:

| Document            | Purpose                                                                  |
|---------------------|--------------------------------------------------------------------------|
| Program Catalog     | Master index — find any program by category, function, table, or pattern |
| Standards           | Naming conventions, structural rules, category-specific requirements     |
| Conversion — Format | Fixed↔Free syntax transformation reference                               |
| Conversion — Access | Native I/O↔SQL transformation reference                                  |
| Consistency         | Verification procedures and checklists                                   |
| Prompts             | Structured prompt templates with pre-checks and required reading         |

The AI reads the catalog to find the right pattern, reads the actual reference program (programs *are* the templates), reads the conversion rules, and produces output that follows the standard. Then a separate verification workflow checks the result.

The documentation is structured as *read this, then read that, then do this* — procedural, not encyclopedic. The AI never needs to rely on its training data for RPG patterns. The system feeds it everything it needs, in order, from a verified codebase.

---

## The Variation System

Every program in the reference library exists in multiple architectural variants:

| Suffix | Format | Data Access  |
|--------|--------|--------------|
| **XN** | Fixed  | Native I/O   |
| **XQ** | Fixed  | Embedded SQL |
| **FN** | Free   | Native I/O   |
| **FQ** | Free   | Embedded SQL |

Same business logic. Different architecture. The framework defines *exactly* what should change between variations and what shouldn't — and the AI follows those rules when creating or verifying any variant.

This is **architectural transformation** — converting between formats and data access methods. My [RPG Refactoring Engine](https://github.com/claudioxgoncalves/rpg-refactoring-engine) handles **structural transformation** — modernising subroutines, API calls, and error handling within the same format. Together, they form a complete modernisation pipeline.

---

## The Workflow in Action

The videos below show a real session — unscripted, unedited — where the framework creates three missing variations of a program and then verifies the results.

### Prompt 1 — Create Variations

Starting from CG1015XN (a Fixed-format, Native I/O query routine), the AI creates three variations in sequence:

| Conversion | Type        | What changes                       |
|------------|-------------|------------------------------------|
| XN → FN    | Format only | Fixed→Free syntax, same Native I/O |
| XN → XQ    | Access only | Native→SQL, same Fixed format      |
| XQ → FQ    | Format only | Fixed→Free syntax, same SQL access |

Each conversion follows the same disciplined sequence: pre-check → catalog lookup → read source → read conversion rules → read reference → convert → report. The AI doesn't create — it *follows instructions*.

📹 **[Watch: Creating three variations](https://1drv.ms/v/c/0a6a30ae31b8d1fe/IQARQyt7R1uETaeJFi6r7PPPARHKNlMaPFRWMyNl918EiEc?e=k8ds8p)**

The four CG1015 variations produced in this session are available for inspection:

| File                                     | Variant               |
|------------------------------------------|-----------------------|
| [CG1015XN.RPGLE](example/CG1015XN.rpgle) | Fixed + Native (base) |
| [CG1015FN.RPGLE](example/CG1015FN.rpgle) | Free + Native         |
| [CG1015XQ.RPGLE](example/CG1015XQ.rpgle) | Fixed + SQL           |
| [CG1015FQ.RPGLE](example/CG1015FQ.rpgle) | Free + SQL            |

### Prompt 2 — Check Variation Consistency

All four variations verified against each other:

- **Logical equivalence** — same interface, same business logic, same subroutine structure, same return method, same external calls.
- **Expected differences** — format syntax and data access patterns differ only in the ways documented by the conversion guides.
- **Cross-variation pairs** — XN↔FN matches FORMAT.txt. XN↔XQ matches ACCESS.txt. XQ↔FQ matches FORMAT.txt. FN↔FQ matches ACCESS.txt.

**Verdict: Equivalent.**

📹 **[Watch: Variation consistency check](https://1drv.ms/v/c/0a6a30ae31b8d1fe/IQAsMQHBI5mXQJytoVGMXzgLAUwx-XE1t4mvtAfp1rgdN5I?e=BEOPqv)**

### Prompt 2 — Check Category Consistency

CG1015 verified against three other programs in the same category (CG1005, CG1010, CG1025):

- **Structural** — header format, section order, subroutine skeleton, exit method.
- **Naming** — `wk*` input, `wa*` output, `cn*` query, `$start`/`$end`/`*inzsr`.
- **Technical** — `chain` + `%found`, no else branch, output pre-cleared in `$start`.
- **Category-specific** — all CG1XXX rules met (read-only, no `$rcode`, no data modification).

**Verdict: Compliant.**

📹 **[Watch: Category consistency check](https://1drv.ms/v/c/0a6a30ae31b8d1fe/IQA69EJlv_i4TprnXAYWihz8AV_BLjSv3Pjze8YBgcs1THQ?e=dGjCMG)**

---

### Full Session (~ 9 minutes)

The complete, uncut workflow — from first conversion to final verification. Every interaction, every AI decision, every document read. Nothing staged.

📹 **[Watch: Full session](https://1drv.ms/v/c/0a6a30ae31b8d1fe/IQAaH4WhmvSTQruXwEu5qzfOAbRPD4lVNBljGNwqtaURMvs?e=hzU6g6)**

---

## Token Economy

AI context windows have limits. The framework is designed for efficiency:

```
~2K tokens    Catalog (route to the right program)
~0.5K tokens  Standards (load the rules)
~2K tokens    Program file (the actual template)
─────────────────────────────────────────────
~4.5K tokens  vs ~50K to read everything
```

Programs are the documentation. The catalog is a routing layer. The AI reads the minimum necessary to produce correct output.

---

## What This Is Not

This is not a code generator. It doesn't produce RPG from natural language descriptions.

This is a **development methodology** — a system that makes AI useful for RPG work by constraining it to operate within proven architectural patterns. The developer defines the patterns. The developer writes the reference implementations. AI handles the mechanical work: creating variations, checking consistency, finding deviations.

The AI never guesses. Every decision it makes is traceable to a specific document. That's not how most people use AI. This is what happens when you design the system first and let AI execute within it.

---

📧 claudioxyzgoncalves@gmail.com

📍 Madeira, Portugal

---

© 2025–2026 Cláudio Gonçalves. All rights reserved.
