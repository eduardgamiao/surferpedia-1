# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table favorite (
  id                        bigint auto_increment not null,
  surfer_id                 bigint,
  user_info_id              bigint,
  constraint pk_favorite primary key (id))
;

create table rating (
  id                        bigint auto_increment not null,
  rating                    integer,
  rating_count              integer,
  user_plus_rating          varchar(255),
  surfer_id                 bigint,
  constraint pk_rating primary key (id))
;

create table surfer (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  hometown                  varchar(255),
  awards                    varchar(255),
  carousel_url              varchar(255),
  bio_url                   varchar(255),
  bio                       longtext,
  slug                      varchar(255),
  type                      varchar(255),
  slug_defined              tinyint(1) default 0,
  footstyle                 varchar(255),
  country                   varchar(255),
  constraint pk_surfer primary key (id))
;

create table surfer_update (
  id                        bigint auto_increment not null,
  date                      varchar(255),
  type                      varchar(255),
  target                    varchar(255),
  constraint pk_surfer_update primary key (id))
;

create table user_info (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  email                     varchar(255),
  password                  varchar(255),
  admin                     tinyint(1) default 0,
  constraint pk_user_info primary key (id))
;


create table rating_user_info (
  rating_id                      bigint not null,
  user_info_id                   bigint not null,
  constraint pk_rating_user_info primary key (rating_id, user_info_id))
;
alter table favorite add constraint fk_favorite_surfer_1 foreign key (surfer_id) references surfer (id) on delete restrict on update restrict;
create index ix_favorite_surfer_1 on favorite (surfer_id);
alter table favorite add constraint fk_favorite_userInfo_2 foreign key (user_info_id) references user_info (id) on delete restrict on update restrict;
create index ix_favorite_userInfo_2 on favorite (user_info_id);
alter table rating add constraint fk_rating_surfer_3 foreign key (surfer_id) references surfer (id) on delete restrict on update restrict;
create index ix_rating_surfer_3 on rating (surfer_id);



alter table rating_user_info add constraint fk_rating_user_info_rating_01 foreign key (rating_id) references rating (id) on delete restrict on update restrict;

alter table rating_user_info add constraint fk_rating_user_info_user_info_02 foreign key (user_info_id) references user_info (id) on delete restrict on update restrict;

# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table favorite;

drop table rating;

drop table rating_user_info;

drop table surfer;

drop table surfer_update;

drop table user_info;

SET FOREIGN_KEY_CHECKS=1;

